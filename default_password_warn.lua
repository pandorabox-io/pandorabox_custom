
local default_pw = minetest.settings:get("default_password")

minetest.register_on_joinplayer(function(player)
  local playername = player:get_player_name()
  local handler = minetest.get_auth_handler()
  local entry = handler.get_auth(playername)
  if entry and minetest.check_password_entry(playername, entry.password, default_pw) then
    -- player has still the default password
    minetest.chat_send_player(
      playername,
      minetest.colorize("#ff0000", "WARNING: You are using the default password! " ..
          "Please change it for your own safety!" ..
          "(press the escape-button and click on 'change password')")
    )
  end
end)
