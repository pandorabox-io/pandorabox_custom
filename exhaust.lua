local timestamp = {}
stamina.register_on_exhaust_player(function(player, change)
	if not player or change < stamina.settings.exhaust_craft then return end
	local now = minetest.get_us_time()
	local name = player:get_player_name()
	if timestamp[name] then
		if now - timestamp[name] > 999999 then
			if (stamina.get_saturation(player) or 0) <= stamina.settings.starve_lvl then
				timestamp[name] = now
				player:set_hp(player:get_hp() - 1, "exhaust")
			end
		end
	else
		timestamp[name] = now
	end
end)
