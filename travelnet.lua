

travelnet.allow_travel = function( player_name, owner_name, network_name, station_name_start, station_name_target )

	if station_name_target and string.sub(station_name_target, 1, 3) == "[P]" then
		-- protected target
		if travelnet.targets[owner_name] and travelnet.targets[owner_name][network_name] and
				not travelnet.targets[owner_name][network_name][station_name] then

			local target_pos = travelnet.targets[owner_name][network_name][station_name].pos
			minetest.load_area(target_pos)
			if minetest.is_protected(target_pos, player_name) then
				return false
			end
		end
	end

	if owner_name == "admin" then
		if minetest.check_player_privs(player_name, { admin_travel=true }) then
			return true
		else
			return false
		end
	end
	return true
end
