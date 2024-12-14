-- No join/leave announcements for some players.
--
-- Priv is given to players e.g. with bad internet connection.
local no_announce_priv = "no_announce"

core.register_privilege(no_announce_priv, {
	description = "player does not get announced",
	give_to_singleplayer = false,
})

--
-- chat commands so players can announce themselves

core.register_chatcommand("announce_join", {
	description = "join message",
	privs = { [no_announce_priv] = true },
	func = function(player_name)
		core.chat_send_all("*** " .. player_name .. " joined the game")
	end,
})


core.register_chatcommand("announce_leave", {
	description = "leave message",
	privs = { [no_announce_priv] = true },
	func = function(player_name)
		core.chat_send_all("*** " ..  player_name .. " left the game.")
	end,
})

--
-- Override functions implementing the priv

local core_send_join_message = core.send_join_message
core.send_join_message = function(player_name)
	if core.check_player_privs(player_name, { [no_announce_priv] = true }) then
		return
	end

	core_send_join_message(player_name)
end


local core_send_leave_message = core.send_leave_message
core.send_leave_message = function(player_name, timed_out)
	if core.check_player_privs(player_name, { [no_announce_priv] = true }) then
		return
	end

	core_send_leave_message(player_name, timed_out)
end

