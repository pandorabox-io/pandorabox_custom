
local privs = {
	{ xp = 10000, name = "areas_protect" },
	{ xp = 10000, name = "moon_access" },
	{ xp = 20000, name = "asteroids_access" },
	{ xp = 40000, name = "lavastone_remove" },

	{ xp = 50000, name = "mars_access" },
	{ xp = 50000, name = "train_operator" },
	{ xp = 50000, name = "train_place" },
	{ xp = 50000, name = "track_builder" },
	{ xp = 50000, name = "railway_operator" },
	{ xp = 50000, name = "interlocking" },

	{ xp = 100000, name = "warzone_access" },
	{ xp = 300000, name = "missions_teleport" },
	{ xp = 450000, name = "jumpdrive_land" },
	{ xp = 500000, name = "areas_high_limit" }
}


xp_redo.register_hook({
  xp_change = function(playername, xp)
    for _, p in ipairs(privs) do
      if xp > p.xp and not minetest.check_player_privs(playername, p.name) then
        -- xp threshold exceeded and priv not yet granted
        local player_privs = minetest.get_player_privs(playername)
        player_privs[p.name] = true
        minetest.set_player_privs(playername, player_privs)
        minetest.chat_send_player(playername, "XP Granted priv acquired: " .. p.name)
      end
    end
  end
})
