minetest.register_on_joinplayer(function(player)


	local privs = minetest.get_player_privs(player:get_player_name())

	-- 2018-08-07 home priv
	if not privs.home then
		privs.home = true
		minetest.set_player_privs(player:get_player_name(), privs)
	end

	-- 2019-06-25
	-- no settime
	if not privs.privs then
		privs["settime"] = nil
		minetest.set_player_privs(player:get_player_name(), privs)
	end

	-- 2019-07-28
	-- https://github.com/pandorabox-io/pandorabox.io/issues/237
	if not privs.tp then
		privs["tp"] = true
		minetest.set_player_privs(player:get_player_name(), privs)
	end

end)

