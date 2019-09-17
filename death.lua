

minetest.register_on_dieplayer(function(player)
	local player_name = player:get_player_name()
	local pos = player:get_pos()

	pos.x = math.floor(pos.x + 0.5)
	pos.y = math.floor(pos.y + 0.5)
	pos.z = math.floor(pos.z + 0.5)

	minetest.log("action", "[death] player '" .. player_name .. "' died at " .. minetest.pos_to_string(pos))
	minetest.chat_send_player(player_name, "You died at " .. minetest.pos_to_string(pos))
end)
