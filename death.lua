
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

	local bone_string = "Bones"
	if player.get_attribute then
		-- [xp_redo] keeps track of deathcount, let's see if it is there
		local count = player:get_attribute("died")
		if count then
			bone_string = "Bone #" .. tostring(count)
		end
	end -- if not fake player
	local hud_id = player:hud_add({
		hud_elem_type = "waypoint",
		name = bone_string .. " " .. pos_string,
		text = "m",
		number = 0xFFFFFF,
		world_pos = pos
	})

	minetest.after(BONES_WAYPOINT_EXPIRES_SECONDS, function()
		-- retrieve player by name, the "player" object should not be carried across server-steps
		player = minetest.get_player_by_name(player_name)
		if player then
			player:hud_remove(hud_id)
		end
	end)

end)
