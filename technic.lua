

-- https://github.com/pandorabox-io/pandorabox.io/issues/330
minetest.register_abm({
        label = "move or drop bones in active reactors",
        nodenames = {"bones:bones"},
        neighbors = {"technic:hv_nuclear_reactor_core_active"},
        interval = 2,
        chance = 1,
        action = function(pos)
			-- try to find nearby space to move bones into
			local newpos = minetest.find_node_near(pos, 1, { "air", "vacuum:vacuum"})
			if newpos ~= nil then
				local meta = minetest.get_meta(pos):to_table()
				minetest.set_node(newpos, { name = "bones:bones" })
				minetest.get_meta(newpos):from_table(meta)
			else
			-- otherwise drop inventory and bones
				local inv = minetest.get_meta(pos):get_inventory()
				for i = 1, inv:get_size("main") do
					local stk = inv:get_stack("main", i)
					inv:set_stack("main", i, nil)
					minetest.add_item(pos, stk:take_item(stk:get_count()))
				end
				minetest.add_item(pos, "bones:bones")
			end
			minetest.set_node(pos, { name = "default:water_source" })
        end
})

