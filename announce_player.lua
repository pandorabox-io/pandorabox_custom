--
-- No join/leave announcements for some players.
--

-- Priv is given to players e.g. with bad internet connection.
local no_announce_priv = "no_announce"

core.register_privilege(no_announce_priv, {
	description = "player does not get announced",
	give_to_singleplayer = false,
})


--
-- [beerchat] compat.
--
local has_beerchat = core.get_modpath("beerchat") and true
local beerchat_on_channel_message
if has_beerchat then
	-- Intercept sending to remote bridge.
	beerchat_on_channel_message = beerchat.on_channel_message
	beerchat.on_channel_message = function(channel, player_name, message, event)
		if channel == beerchat.main_channel_name
			-- New players are always announced.
			and (message == "❱ Joined the game"
				-- Catch time-out messages too. (❰ is 3 bytes long)
				or message:sub(1, 17) == "❰ Left the game")
			and core.check_player_privs(player_name, { [no_announce_priv] = true })
		then
			return
		end

		-- Send normally.
		beerchat_on_channel_message(channel, player_name, message, event)
	end
else
	-- Noop to satisfy luacheck.
	beerchat_on_channel_message = function() end
end

--
-- chat commands so players can announce themselves.
--

core.register_chatcommand("announce_join", {
	description = "join message",
	privs = { [no_announce_priv] = true },
	func = function(player_name)
		core.chat_send_all("*** " .. player_name .. " joined the game")
		if has_beerchat then
			beerchat_on_channel_message(beerchat.main_channel_name,
				player_name, "❱ Joined the game")
		end
	end,
})


core.register_chatcommand("announce_leave", {
	description = "leave message",
	privs = { [no_announce_priv] = true },
	func = function(player_name)
		core.chat_send_all("*** " ..  player_name .. " left the game.")
		if has_beerchat then
			beerchat_on_channel_message(beerchat.main_channel_name,
				player_name, "❰ Left the game")
		end
	end,
})

--
-- Override functions implementing the priv.
--

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

