
beerchat.register_callback("before_join", function(name, channel)
        if channel == "mod" then
                local success = minetest.check_player_privs(name, "staff")
                return success
        end
end)
