
beerchat.register_callback("before_join", function(name, channel)
        if channel == "mod" and not minetest.check_player_privs(name, "staff") then
                return false
        end
end)
