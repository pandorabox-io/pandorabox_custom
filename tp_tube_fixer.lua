
local tube_nodes = {
	"pipeworks:teleport_tube_1",
	"pipeworks:teleport_tube_2",
	"pipeworks:teleport_tube_3",
	"pipeworks:teleport_tube_4",
	"pipeworks:teleport_tube_5",
	"pipeworks:teleport_tube_6",
	"pipeworks:teleport_tube_7",
	"pipeworks:teleport_tube_8",
	"pipeworks:teleport_tube_9",
	"pipeworks:teleport_tube_10"
}

-- LBM to fix broken tp tubes if/when the tube db gets corrupted
minetest.register_lbm({
	name = "pandorabox_custom:tp_tube_fixer",
	nodenames = tube_nodes,
	run_at_every_load = true,
	action = function(pos)
		local db = pipeworks.tptube.get_db()
		local hash = pipeworks.tptube.hash(pos)
		if not db[hash] then
			local meta = minetest.get_meta(pos)
			local channel = meta:get_string("channel")
			if "" == channel then return end
			
			local can_receive = meta:get_int("can_receive")
			db[hash] = { x = pos.x, y = pos.y, z = pos.z, channel = channel, cr = can_receive }
			pipeworks.tptube.save_tube(hash)
			pipeworks.tptube.update_meta(meta) -- not passing can_receive intentionally
		end
	end
})
