local has_xp_redo_mod = minetest.get_modpath("xp_redo")

-- current world height limit
local max_height = 18000



-- generic travel check
-- returns (success, error_message)
pandorabox.can_travel = function(player, pos)

	if pos.y > max_height then
		-- world height limit
		return false, "The area above " ..  max_height .. " is reserved for future use, sorry..."
	end

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
		return false, "You need " .. req_xp .. " xp to travel to world-height of " .. math.floor(pos.y)
	end
end


-- teleport only check (for "walk-only" areas)
-- returns (success, error_message)
pandorabox.can_teleport = function(player, pos)

	-- check if the player can travel there "by foot"
	local can_travel, err_msg = pandorabox.can_travel(player, pos)
	if not can_travel then
		return false, err_msg
	end

	-- walk-only areas here

	-- amun system
	-- x=10000, z=15000, y=9700
	-- system-radius=500
	-- sun-radius=250, planet-radius=100

	local amun_sun_pos = { x=10000, z=15000, y=9700 }
	local distance = vector.distance(amun_sun_pos, pos)

	if distance > 50 and distance < 800 then
		-- only allow teleporting in the center of the system
		return false, "Can't travel into Amun subspace-bubble!"
	end

	return true
end









