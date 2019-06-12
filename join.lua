minetest.register_on_joinplayer(function(player)

	-- 2018-08-07 home priv
	if not minetest.check_player_privs(player, { home=true }) then
		local privs = minetest.get_player_privs(player:get_player_name())
		privs.home = true
		minetest.set_player_privs(player:get_player_name(), privs)
	end

	-- 2018-11-12
	-- register last connected ip
	local ip = minetest.get_player_ip(player:get_player_name())
	player:set_attribute("last_ip", ip);

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
