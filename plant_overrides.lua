-- This file contains plantlife-related overrides

-- Players should be able to climb bamboo trunks and leaves
minetest.override_item("bamboo:trunk", {
	walkable = false,
	climbable = true
})

minetest.override_item("bamboo:leaves", {
	walkable = false,
	climbable = true
})
