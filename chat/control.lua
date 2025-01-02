
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
		local travelnets = travelnet.get_travelnets(owner_name)
		if travelnets and
			travelnets[network_name] and
			travelnets[network_name][station_name] then
				local station = travelnets[network_name][station_name]
				local target_pos = station.pos
				if target_pos then
					player:setpos(target_pos)
					minetest.chat_send_player(name, "Teleported to the control room!")
				end
		end
	end
})
