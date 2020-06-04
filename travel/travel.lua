-- current world height limit
local max_height = 18000

-- generic travel check
-- returns (success, error_message)
pandorabox.can_travel = function(player, pos)

	-- world height limit
	if pos.y > max_height then
		return false, "The area above " ..  max_height .. " is reserved for future use, sorry..."
	end

	-- moon
	if pos.y > 5000 and pos.y < 6000 and not minetest.check_player_privs(player, "moon_access") then
		return false, "You need the 'moon_access' priv to go to the moon!"
	end

	-- asteroids
	if pos.y > 6000 and pos.y < 10000 and not minetest.check_player_privs(player, "asteroids_access") then
		return false, "You need the 'asteroids_access' priv to go to the asteroids!"
	end

	-- mars
	if pos.y > 10000 and pos.y < 17000 and not minetest.check_player_privs(player, "mars_access") then
		return false, "You need the 'mars_access' priv to go to the mars!"
	end

	-- warzone
	if pos.y > 17000 and pos.y < 18000 and not minetest.check_player_privs(player, "warzone_access") then
		return false, "You need the 'warzone_access' priv to go to the warzone!"
	end

	-- non-restricted area
	return true
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
	-- TODO: maybe add warzone here

	return true
end
