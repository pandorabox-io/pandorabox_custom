
-- /dump_pos
-- prints all players with their current position into the logs
-- best used for persistent lag which could be abm/position related (mesecons)
minetest.register_chatcommand("dump_pos", {
    description = "Teleport you to spawn point.",
    privs = { ban = true },
    func = function(name, params)
	minetest.log(
		"warning",
		"[dump_pos] dumping player positions, initiated by player: " ..
			name .. " reason: " .. (params or "")
	)
	for _, player in ipairs(minetest.get_connected_players()) do
		local pname = player:get_player_name()
		local pos = player:get_pos()
		minetest.log("warning", "[dump_pos] Position of " .. pname .. ": " .. minetest.pos_to_string(pos))
	end
	return true, "positions dumped to log!"
    end
})
