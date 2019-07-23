


minetest.register_chatcommand("announce_join", {
	description = "join message",
	privs = {no_announce=true},
	func = function(player_name)
		minetest.chat_send_all("*** " .. player_name .. " joined the game.")
	end
})



minetest.register_chatcommand("announce_leave", {
	description = "leave message",
	privs = {no_announce=true},
	func = function(player_name)
		minetest.chat_send_all("*** " ..  player_name .. " left the game.")
	end
})
