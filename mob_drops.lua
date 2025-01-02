
unified_inventory.register_craft_type("mob_drop", {
	description = "Drops",
	icon = "default_tool_steelsword.png",
	width = 1,
	height = 1,
})

unified_inventory.register_craft_type("mob_drop_player", {
	description = "Drops (killed by player)",
	icon = "default_tool_mesesword.png",
	width = 1,
	height = 1,
})

local function add_drop_recipes(name)
	local mob = minetest.registered_entities[name]
	if not mob or type(mob.drops) ~= "table" then
		return
	end
	for _,drop in pairs(mob.drops) do
		if minetest.registered_items[drop.name] then
			unified_inventory.register_craft({
				type = drop.min > 0 and "mob_drop" or "mob_drop_player",
				output = drop.name,
				items = {name},
				width = 0,
			})
		end
	end
end

minetest.register_on_mods_loaded(function()
	for name, def in pairs(minetest.registered_craftitems) do
		if def.groups and def.groups.spawn_egg == 1 then
			add_drop_recipes(name)
		end
	end
end)
