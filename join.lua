minetest.register_on_joinplayer(function(player)


	local privs = minetest.get_player_privs(player:get_player_name())

	-- 2019-06-25
	-- revoke settime from non-admins
	if not privs.privs and privs.settime then
		privs["settime"] = nil
		minetest.set_player_privs(player:get_player_name(), privs)
	end

end)
