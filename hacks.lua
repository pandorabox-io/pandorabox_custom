

-- the pathfinder is highly unreliable and grinds the server to a halt sometimes
-- see: https://github.com/minetest/minetest/issues/8584
-- lobodomizing on this end to make the mobs_* packages updateable again
minetest.find_path = function()
	return nil
end

-- unregister ip-ban command (use xban instead)
-- there are still problems with the ipv6 range comming in from a single ipv4 ip
minetest.unregister_chatcommand("ban")

-- stolen from
-- https://github.com/minetest/minetest_game/blob/d2e051f1795576213f807ec0feac5f72f51c6113/mods/default/nodes.lua
-- fixes https://github.com/pandorabox-io/pandorabox.io/issues/358
-- TODO: remove after upgrade to next mt_game > 5.1.0
local function coral_on_place(itemstack, placer, pointed_thing)
	if pointed_thing.type ~= "node" or not placer then
		return itemstack
	end

	local player_name = placer:get_player_name()
	local pos_under = pointed_thing.under
	local pos_above = pointed_thing.above
	local node_under = minetest.get_node(pos_under)
	local def_under = minetest.registered_nodes[node_under.name]

	if def_under and def_under.on_rightclick and not placer:get_player_control().sneak then
		return def_under.on_rightclick(pos_under, node_under,
				placer, itemstack, pointed_thing) or itemstack
	end

	if node_under.name ~= "default:coral_skeleton" or
			minetest.get_node(pos_above).name ~= "default:water_source" then
		return itemstack
	end

	if minetest.is_protected(pos_under, player_name) or
			minetest.is_protected(pos_above, player_name) then
		minetest.log("action", player_name
			.. " tried to place " .. itemstack:get_name()
			.. " at protected position "
			.. minetest.pos_to_string(pos_under))
		minetest.record_protection_violation(pos_under, player_name)
		return itemstack
	end

	node_under.name = itemstack:get_name()
	minetest.set_node(pos_under, node_under)
	itemstack:take_item()

	return itemstack
end

minetest.override_item("default:coral_green", {
	on_place = coral_on_place
})
minetest.override_item("default:coral_pink", {
	on_place = coral_on_place
})
minetest.override_item("default:coral_cyan", {
	on_place = coral_on_place
})
