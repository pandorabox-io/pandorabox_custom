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

end)

old_send_join_message = minetest.send_join_message

minetest.send_join_message = function(player_name)
	if minetest.check_player_privs(player_name, { no_announce=true }) then
		return
	end
	old_send_join_message(player_name)
end

old_send_leave_message = minetest.send_leave_message

minetest.send_leave_message = function(player_name, timed_out)
	if minetest.check_player_privs(player_name, { no_announce=true }) then
                return
        end
	old_send_leave_message(player_name, timed_out)
end
