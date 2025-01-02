
local privs = {
	{ xp = 10000, name = "areas_protect" },
	{ xp = 10000, name = "moon_access" },
	{ xp = 15000, name = "blockexchange_protected_upload" },
	{ xp = 20000, name = "asteroids_access" },
	{ xp = 40000, name = "lavastone_remove" },

	{ xp = 50000, name = "mars_access" },
	{ xp = 50000, name = "train_operator" },
	{ xp = 50000, name = "train_place" },
	{ xp = 50000, name = "track_builder" },
	{ xp = 50000, name = "railway_operator" },

	{ xp = 100000, name = "warzone_access" },
	{ xp = 200000, name = "spacecannon_unrestricted" },
	{ xp = 300000, name = "missions_teleport" },
	{ xp = 450000, name = "jumpdrive_land" },
	{ xp = 500000, name = "areas_high_limit" }
}

-- playername -> time_of_last_check
local last_check_map = {}

local function check_autogrant(playername, xp)
	local now = os.time()
	local last_check = last_check_map[playername]

	if last_check and (now - last_check) < 2 then
		-- check was executed shortly before, wait a bit to re-check again
		-- in case player is using a digtron or a fast tool
		return
	end

	last_check_map[playername] = now

	-- get player priv map
	local player_privs = minetest.get_player_privs(playername)

	-- dirty flag
	local changed = false

	-- loop over privs and grant priv if xp reached and not granted yet
	for _, p in ipairs(privs) do
		if xp > p.xp and not player_privs[p.name] then
			-- xp threshold exceeded and priv not yet granted
			player_privs[p.name] = true
			changed = true
			minetest.chat_send_player(playername, "XP Granted priv acquired: " .. p.name)
		end
	end

	if changed then
		-- apply changed privs
		minetest.set_player_privs(playername, player_privs)
	end
end

-- add xp_redo hook
xp_redo.register_hook({
  xp_change = check_autogrant
})

-- check privs upon joining
minetest.register_on_joinplayer(function(player)
	local playername = player:get_player_name()
	local xp = xp_redo.get_xp(playername)
	check_autogrant(playername, xp)
end)

-- clear last_check cache
minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	last_check_map[playername] = nil
end)
