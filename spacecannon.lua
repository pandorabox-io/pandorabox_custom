
spacecannon.can_shoot = function(pos, playername)
	local has_unrestricted_priv = playername and minetest.check_player_privs(playername, "spacecannon_unrestricted")
	-- only allow shooting in space or with priv
	return has_unrestricted_priv or pos.y > 1000
end
