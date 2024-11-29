-- Overrides 'scifi_nodes:powered_stand' and 'scifi_nodes:itemholder' to fix various issues:
-- https://github.com/pandorabox-io/pandorabox.io/issues/293
-- https://github.com/pandorabox-io/pandorabox.io/issues/341
-- https://github.com/D00Med/scifi_nodes/pull/22#issuecomment-536384401

-- Uses modified code from itemframes mod: https://gitlab.com/VanessaE/homedecor_modpack/tree/master/itemframes

local tmp = {}
local screwdriver = screwdriver or {}

minetest.register_entity("pandorabox_custom:scifi_item",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 0.25, y = 0.25},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"air"},
	on_activate = function(self, staticdata)
		if tmp.nodename ~= nil and tmp.texture ~= nil then
			self.nodename = tmp.nodename
			tmp.nodename = nil
			self.texture = tmp.texture
			tmp.texture = nil
		else
			if staticdata ~= nil and staticdata ~= "" then
				local data = staticdata:split(';')
				if data and data[1] and data[2] then
					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end
		if self.texture ~= nil then
			self.object:set_properties({textures = {self.texture}})
		end
		self.object:set_properties({automatic_rotate = 1})
		if self.texture ~= nil and self.nodename ~= nil then
			local entity_pos = vector.round(self.object:get_pos())
			local objs = minetest.get_objects_inside_radius(entity_pos, 0.5)
			for _, obj in ipairs(objs) do
				if obj ~= self.object and
				   obj:get_luaentity() and
				   obj:get_luaentity().name == "pandorabox_custom:scifi_item" and
				   obj:get_luaentity().nodename == self.nodename and
				   obj:get_properties() and
				   obj:get_properties().textures and
				   obj:get_properties().textures[1] == self.texture then
					self.object:remove()
					break
				end
			end
		end
	end,
	get_staticdata = function(self)
		if self.nodename ~= nil and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end
		return ""
	end,
})

local function remove_item(pos, node)
	local objs = nil
	if node.name == "scifi_nodes:itemholder" then
		objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y+0.2,z=pos.z}, .5)
	elseif node.name == "scifi_nodes:powered_stand" then
		objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y+0.75,z=pos.z}, .5)
	end
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "pandorabox_custom:scifi_item" then
				obj:remove()
			end
		end
	end
end

local function update_item(pos, node)
	remove_item(pos, node)
	local meta = minetest.get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "scifi_nodes:itemholder" then
			pos.y = pos.y + 0.2
		elseif node.name == "scifi_nodes:powered_stand" then
			pos.y = pos.y + 0.75
		end
		tmp.nodename = node.name
		tmp.texture = ItemStack(meta:get_string("item")):get_name()
		minetest.add_entity(pos,"pandorabox_custom:scifi_item")
	end
end

local function drop_item(pos, node)
	local meta = minetest.get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "scifi_nodes:itemholder" then
			minetest.add_item({x=pos.x,y=pos.y+0.2,z=pos.z}, meta:get_string("item"))
		elseif node.name == "scifi_nodes:powered_stand" then
			minetest.add_item({x=pos.x,y=pos.y+0.75,z=pos.z}, meta:get_string("item"))
		end
		meta:set_string("item","")
	end
	remove_item(pos, node)
end

local function is_owner(pos, player)
	local name = ""
	if player then
		name = player:get_player_name()
	end
	local owner = minetest.get_meta(pos):get_string("owner")
	if owner == "" or owner == name or minetest.check_player_privs(name, "protection_bypass") then
		return true
	end
	return false
end

local function override_node(node_name, info_name)
	minetest.override_item(node_name, {
		on_rotate = screwdriver.disallow,
		after_place_node = function(pos, player, itemstack)
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", player:get_player_name())
			meta:set_string("infotext", info_name.." (owned by "..meta:get_string("owner")..")")
		end,
		on_rightclick = function(pos, node, player, itemstack)
			if not itemstack then return end
			if is_owner(pos, player) then
				drop_item(pos, node)
				local item = itemstack:take_item()
				minetest.get_meta(pos):set_string("item", item:to_string())
				update_item(pos, node)
			end
			return itemstack
		end,
		on_punch = function(pos, node, player)
			if is_owner(pos, player) then
				drop_item(pos, node)
			end
		end,
		can_dig = function(pos, player)
			return is_owner(pos, player)
		end,
		on_destruct = function(pos)
			if minetest.get_meta(pos):get_string("item") ~= "" then
				drop_item(pos, minetest.get_node(pos))
			end
		end
	})
end

override_node("scifi_nodes:itemholder", "Item holder")
override_node("scifi_nodes:powered_stand", "Powered stand")

-- automatically restore entities lost from powered_stands/itemholders due to /clearobjects or similar
minetest.register_lbm({
	label = "Maintain powered_stand and itemholder entities",
	name = "pandorabox_custom:maintain_scifi_nodes_entities",
	nodenames = {"scifi_nodes:powered_stand", "scifi_nodes:itemholder"},
	run_at_every_load = true,
	action = function(pos, node)
		minetest.after(0,
			function(pos1, node1)
				local meta = minetest.get_meta(pos1)
				local itemstring = meta:get_string("item")
				if itemstring ~= "" then
					local entity_pos = pos1
					if node1.name == "scifi_node1s:itemholder" then
						entity_pos = {x=pos1.x,y=pos1.y+0.2,z=pos1.z}
					elseif node1.name == "scifi_node1s:powered_stand" then
						entity_pos = {x=pos1.x,y=pos1.y+0.75,z=pos1.z}
					end
					local objs = minetest.get_objects_inside_radius(entity_pos, 0.5)
					if #objs == 0 then
						update_item(pos1, node1)
					end
				end
			end,
		pos, node)
	end
})

-- stop mesecon pistons from pushing powered_stands and itemholders
if minetest.get_modpath("mesecons_mvps") then
	mesecon.register_mvps_stopper("scifi_nodes:powered_stand")
	mesecon.register_mvps_stopper("scifi_nodes:itemholder")
end
