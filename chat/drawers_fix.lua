
minetest.register_chatcommand("drawers_fix", {
	description = "recreates the drawer-visuals in your area",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return
		end
        local t1 = minetest.get_us_time()

        local ppos = player:get_pos()
        local pos1 = vector.subtract(ppos, 10)
        local pos2 = vector.add(ppos, 10)

        local poslist = minetest.find_nodes_in_area(pos1, pos2, {"group:drawer"})

        for _, pos in ipairs(poslist) do
            drawers.remove_visuals(pos)
            drawers.spawn_visuals(pos)
        end

        local t2 = minetest.get_us_time()
        local diff = t2 - t1
        local millis = diff / 1000

        return true, "Restored " .. #poslist .. " drawers in " .. millis .. " ms"
	end
})
