
local BONES_WAYPOINT_EXPIRES_SECONDS = 42 * 60

minetest.register_on_dieplayer(function(player)
	local player_name = player:get_player_name()
	local pos = player:get_pos()

	pos.x = math.floor(pos.x + 0.5)
	pos.y = math.floor(pos.y + 0.5)
	pos.z = math.floor(pos.z + 0.5)

	local pos_string = minetest.pos_to_string(pos)

	minetest.log("action", "[death] player '" .. player_name .. "' died at " .. pos_string)
	minetest.chat_send_player(player_name, "You died at " .. pos_string)

	local hud_id = player:hud_add({
		hud_elem_type = "waypoint",
		name = "Bones " .. pos_string,
		text = "m",
		number = 0xFFFFFF,
		world_pos = pos
	})

	minetest.after(BONES_WAYPOINT_EXPIRES_SECONDS, function() player:hud_remove(hud_id) end)

end)
