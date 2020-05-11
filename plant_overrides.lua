-- This file contains plantlife-related overrides

-- Players should be able to climb bamboo trunks
minetest.override_item("bamboo:trunk", {
	climbable = true
})
