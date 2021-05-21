local timestamp = {}
stamina.register_on_exhaust_player(function(player)
	if not player then return end
	local now = minetest.get_us_time()
	if timestamp[player:get_player_name()] then
		if now - timestamp[player:get_player_name()] > 999999 then
			local exhaustion = stamina.get_exhaustion(player) or 0
			if exhaustion >= stamina.settings.exhaust_lvl then
				timestamp[player:get_player_name()] = now
				player:set_hp(player:get_hp() - 1, "exhaust")
			end
		end
	else
		timestamp[player:get_player_name()] = now
	end
end)
