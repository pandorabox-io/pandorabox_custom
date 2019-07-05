local old_travel_allowed = telemosaic.travel_allowed

telemosaic.travel_allowed = function(player, src, dest)

	local can_teleport, err_msg = pandorabox.can_teleport(player, dest)
	if not can_teleport then
		-- not allowed
		minetest.chat_send_player(player:get_player_name(), err_msg or "")
		return false
	else
		return old_travel_allowed(player, src, dest)
	end
end