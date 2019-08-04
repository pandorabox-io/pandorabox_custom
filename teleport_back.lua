-- static spawn point
local spawn_pos = minetest.setting_get_pos("static_spawnpoint")

-- check every few seconds if the player belongs to the current position
-- if not, teleport them back to spawn
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime

	if not spawn_pos then
		return
	end

	-- every 10 seconds
	if timer < 10 then return end
	timer = 0

	for _,player in ipairs(minetest.get_connected_players()) do

		local pos = player:getpos()

		-- check if player can travel there
		local can_travel, err_msg = pandorabox.can_travel(player, pos)
		if not can_travel then
			player:set_pos(spawn_pos)
			if err_msg then
				minetest.chat_send_player(player:get_player_name(), err_msg)
			end
		end
	end
end)
