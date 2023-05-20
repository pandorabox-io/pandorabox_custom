
local restart = false

minetest.register_on_leaveplayer(function()
    minetest.after(1, function()
        if restart and #minetest.get_connected_players() == 0 then
            -- no one online, restart
            beerchat.on_channel_message("main", "SYSTEM", "➢ Scheduled restart")
            minetest.request_shutdown("scheduled", true)
        end
    end)
end)

minetest.register_chatcommand("restart_if_empty", {
    description = "restarts the server when the last player leaves",
    privs = { ban = true },
    func = function()
        restart = true
    end
})
