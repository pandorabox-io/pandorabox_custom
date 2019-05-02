

-- mithril chest: 15x6 stacks = 8910 items
-- drawer with 6 8x upgrades: ca. 28600 items (x4) :(

minetest.register_lbm({
	label = "Drawers replacement",
	name = "pandorabox_custom:drawers",
	nodenames = {
		"drawers:wood1", "drawers:wood","drawers:wood",
		"drawers:acacia_wood1","drawers:acacia_wood2","drawers:acacia_wood4",
		"drawers:aspen_wood1","drawers:aspen_wood2","drawers:aspen_wood4",
		"drawers:junglewood1","drawers:junglewood2","drawers:junglewood4",
		"drawers:pine_wood1","drawers:pine_wood2","drawers:pine_wood4"
	},
	run_at_every_load = true,
	action = function(pos, node)
		-- technic:mithril_locked_chest
		-- local oldmeta = minetest.get_meta(pos)
		-- TODO: owner?

	end
})
