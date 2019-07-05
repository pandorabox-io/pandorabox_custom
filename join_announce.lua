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
