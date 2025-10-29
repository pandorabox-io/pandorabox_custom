--
-- No join/leave announcements for some players.
--

-- Priv is given to players e.g. with bad internet connection.
local no_announce_priv = "no_announce"

core.register_privilege(no_announce_priv, {
	description = "player does not get announced",
	give_to_singleplayer = false,
})

local has_beerchat = core.get_modpath("beerchat") and true
local beerchat_skip = {}
local store = core.get_mod_storage()
local last_was_join = {}

-- Check priv and keep track of event count.
local function skip_announce(player_name)
	local has_priv = core.check_player_privs(player_name, { [no_announce_priv] = true })
	if not has_priv then
		return false, has_priv
	end

	local key = "announce_" .. player_name
	local i = store:get_int(key)
	if 0 >= i then
		beerchat_skip[player_name] = true
		return true, has_priv
	end

	i = i - 1
	store:set_int(key, i)
	if 0 == i then
		core.chat_send_player(player_name, 'The "' .. no_announce_priv
			.. '" priv is active again.')
	end
	return false, has_priv
end

--
-- [beerchat] compat.
--
local beerchat_on_channel_message = function() end
if has_beerchat then
	-- Intercept sending to remote bridge.
	beerchat_on_channel_message = beerchat.on_channel_message
	beerchat.on_channel_message = function(channel, player_name, message, event)
		if channel == beerchat.main_channel_name
			-- New players are always announced.
			and (message == "❱ Joined the game"
				-- Catch time-out messages too. (❰ is 3 bytes long)
				or message:sub(1, 17) == "❰ Left the game")
			and beerchat_skip[player_name]
		then
			beerchat_skip[player_name] = nil
			return
		end

		-- Send normally.
		beerchat_on_channel_message(channel, player_name, message, event)
	end
end

--
-- Chat command so players can announce themselves.
--

local function announce_join(player_name)
	last_was_join[player_name] = true
	core.chat_send_all("*** " .. player_name .. " joined the game")
	if has_beerchat then
		beerchat_on_channel_message(beerchat.main_channel_name,
			player_name, "❱ Joined the game")
	end
end


local function announce_leave(player_name)
	last_was_join[player_name] = nil
	core.chat_send_all("*** " ..  player_name .. " left the game.")
	if has_beerchat then
		beerchat_on_channel_message(beerchat.main_channel_name,
			player_name, "❰ Left the game")
	end
end


core.register_chatcommand("announce", {
	description = "announce [join | leave | auto [<number of events>]]",
	privs = { [no_announce_priv] = true },
	func = function(player_name, params)
		local first = string.lower(params):sub(1, 1)
		if 'j' == first then announce_join(player_name)
		elseif 'l' == first then announce_leave(player_name)
		elseif 'a' == first then
			-- Suppress priv for next i events.
			local i = tonumber(params:split(' ')[2]) or 2
			store:set_int("announce_" .. player_name, i)
			local message = "Automatic announce is off."
			if 0 < i then
				message = "Next " .. (1 == i and "event" or i .. " events")
					.. " will be announced automatically." end
			return true, message
		else
			-- Do the announcement that is not the last one made.
			if last_was_join[player_name] then
				announce_leave(player_name)
			else
				announce_join(player_name)
			end
		end
	end,
})

--
-- Override functions implementing the priv.
--

local core_send_join_message = core.send_join_message
core.send_join_message = function(player_name)
	local skip, has_priv = skip_announce(player_name)
	if skip then
		return
	elseif has_priv then
		last_was_join[player_name] = true
	end

	core_send_join_message(player_name)
end


local core_send_leave_message = core.send_leave_message
core.send_leave_message = function(player_name, timed_out)
	local skip, has_priv = skip_announce(player_name)
	if skip then
		return
	elseif has_priv then
		last_was_join[player_name] = nil
	end

	core_send_leave_message(player_name, timed_out)
end

