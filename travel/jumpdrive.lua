local default_after_place = minetest.registered_nodes["jumpdrive:engine"].after_place_node
local function custom_after_place(pos, placer)
	default_after_place(pos, placer)
	local playername = placer:get_player_name()
	local has_landing_priv = minetest.check_player_privs(playername, { jumpdrive_land = true })
	if not has_landing_priv and -20 < pos.y and 100 > pos.y then
		minetest.chat_send_player(playername, "You won't be able to jump away from here until you have jumpdrive_land priv!")
	end
end
minetest.override_item("jumpdrive:engine", { after_place_node = custom_after_place })

jumpdrive.preflight_check = function(source, destination, radius, playername)
	local has_landing_priv = minetest.check_player_privs(playername, {jumpdrive_land=true})

	-- check for height limit, only space travel allowed
	if destination.y > -20 and destination.y < 100 and not has_landing_priv then
		return { success=false, message="Atmospheric travel not allowed!" }
	end
	-- check for height limit, only space travel allowed
	if source.y > -20 and source.y < 100 and not has_landing_priv then
		return { success=false, message="Atmospheric travel not allowed!" }
	end

	local can_teleport, err_msg = pandorabox.can_teleport(playername, destination)
	if not can_teleport then
		return { success=false, message="Jump failed: " .. (err_msg or "") }
	end

	-- everything ok
	return { success=true }
end
