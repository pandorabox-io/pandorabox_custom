
local privs = {
  -- { xp = 10000, name = "" },
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
