
-- server control room coordinates (travelnet)
local owner_name = "shared"
local network_name = "staff"
local station_name = "(P) Control"

minetest.register_chatcommand("control", {
	description = "Teleports you to the server control room",
	privs = { staff = true },
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return
		end

		-- check if the travelnet station is valid
		local networks = travelnet.get_networks(owner_name)
		if networks and networks[network_name] and networks[network_name][station_name] then
				local station = networks[network_name][station_name]
				local target_pos = station.pos
				if target_pos then
					player:setpos(target_pos)
			    minetest.chat_send_player(name, "Teleported to the control room!")
				end
		end
	end
})
