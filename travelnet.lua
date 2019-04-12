

travelnet.allow_travel = function( player_name, owner_name, network_name, station_name_start, station_name_target )
	if owner_name == "admin" then
		if minetest.check_player_privs(player_name, { admin_travel=true }) then
			return true
		else
			return false
		end
	end
	return true
end
