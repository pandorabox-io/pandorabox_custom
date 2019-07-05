jumpdrive.preflight_check = function(source, destination, radius, playername)
	local has_landing_priv = minetest.check_player_privs(playername, {jumpdrive_land=true})

	-- check for height limit, only space travel allowed
	if destination.y > -20 and destination.y < 100 and not has_landing_priv then
		return { success=false, message="Atmospheric travel not allowed!" }
	end

	local player = minetest.get_player_by_name(playername)
	if player then
		-- player is online, check limits (non-automatic jump)
		local can_teleport, err_msg = pandorabox.can_teleport(player, destination)
		if not can_teleport then
			return { success=false, message="Jump failed: " .. (err_msg or "") }
		end
	end

	-- everything ok
	return { success=true }
end