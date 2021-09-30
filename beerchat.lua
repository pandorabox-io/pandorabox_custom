
beerchat.register_callback("before_join", function(name, channel)
        if channel == "mod" and not minetest.check_player_privs(name, "staff") then
                return false
        end
end)

atwarn = function(t, ...)
	local text = advtrains.print_concat_table({t, ...})
	minetest.log("warning", "[advtrains]"..text)
	--minetest.chat_send_all("[advtrains] -!- "..text)
	beerchat.send_on_channel("[advtrains] -!- ", "advtrains", text)
end

--ONLY use this function for temporary debugging. for consistent debug prints use atprint
atdebug = function(t, ...)
	local text = advtrains.print_concat_table({t, ...})
	minetest.log("action", "[advtrains]"..text)
	--minetest.chat_send_all("[advtrains]"..text)
	beerchat.send_on_channel("[advtrains]", "advtrains", text)
end
