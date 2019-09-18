

-- https://github.com/pandorabox-io/pandorabox.io/issues/330
-- replaces bones in an active reactor with a water source
minetest.register_abm({
        label = "liquify bones in active reactors",
        nodenames = {"bones:bones"},
        neighbors = {"technic:hv_nuclear_reactor_core_active"},
        interval = 2,
        chance = 1,
        action = function(pos)
		minetest.set_node(pos, { name="default:water_source" })
        end
})

