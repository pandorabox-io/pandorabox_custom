local has_xp_redo_mod = minetest.get_modpath("xp_redo")

pandorabox.can_travel = function(player, pos)

	if not has_xp_redo_mod then
		-- no xp system
		return true
	end

	local req_xp = 0

	if pos.y > 5000 then
		-- moon
		req_xp = 10000
	end

	if pos.y > 6000 then
		-- asteroids
		req_xp = 20000
	end

	if pos.y > 10000 then
		-- mars
		req_xp = 50000
	end

	if pos.y > 17000 then
		-- warzone
		req_xp = 100000
	end

	local playername = player:get_player_name()
	local xp = xp_redo.get_xp(playername)

	if xp >= req_xp then
		return true
	else
		minetest.chat_send_player(playername, "You need " .. req_xp .. " xp to travel to world-height of " .. math.floor(pos.y))
		return false
	end
end


if minetest.get_modpath("jumpdrive") then
	jumpdrive.preflight_check = function(source, destination, radius, player)
		local has_landing_priv = minetest.check_player_privs(player, {jumpdrive_land=true})

		-- check for height limit, only space travel allowed
		if destination.y > -20 and destination.y < 100 and not has_landing_priv then
			return { success=false, message="Atmospheric travel not allowed!" }
		end

		-- check for upper limit
		if destination.y > 18000 then
			return { success=false, message="Region above 18k is reserved for now.." }
		end

		if not pandorabox.can_travel(player, destination) then
			return { success=false, message="Jump failed" }
		end

		-- everything ok
		return { success=true }
	end
end

if minetest.get_modpath("telemosaic") then
	local old_travel_allowed = telemosaic.travel_allowed

	telemosaic.travel_allowed = function(player, src, dest)
		if not pandorabox.can_travel(player, dest) then
			return false
		else
			return old_travel_allowed(player, src, dest)
		end
	end
end

if minetest.get_modpath("travelnet") then
	travelnet.allow_travel = function( player_name, owner_name, network_name, station_name_start, station_name_target )

		local has_override_priv = minetest.check_player_privs(player_name, { protection_bypass=true })
		if has_override_priv then
			return true
		end

		local target_pos

		if travelnet.targets[owner_name] and travelnet.targets[owner_name][network_name] and
			travelnet.targets[owner_name][network_name][station_name_target] then
			target_pos = travelnet.targets[owner_name][network_name][station_name_target].pos
		else
			-- error!
			return false
		end

		if station_name_target and string.sub(station_name_target, 1, 3) == "(P)" then
			-- protected target
			if travelnet.targets[owner_name] and travelnet.targets[owner_name][network_name] and
					travelnet.targets[owner_name][network_name][station_name_target] then
				minetest.load_area(target_pos)
				if minetest.is_protected(target_pos, player_name) then
					minetest.chat_send_player(player_name, "This station is protected!")
					return false
				end
			end
		end

		-- check xp
		local player = minetest.get_player_by_name(player_name)
		return pandorabox.can_travel(player, target_pos)
	end
end

local spawn_pos = minetest.setting_get_pos("static_spawnpoint")

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime

	if not spawn_pos then
		return
	end

	-- every 2 seconds
	if timer < 2 then return end
	timer = 0

	for _,player in ipairs(minetest.get_connected_players()) do

		local pos = player:getpos()
		-- check if y-height allowed with xp
		if not pandorabox.can_travel(player, pos) then
			player:set_pos(spawn_pos)
		end

	end
end)
