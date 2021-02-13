local sound_gravel = default.node_sound_gravel_defaults()

-- sanity checks
assert(sound_gravel)

-- custom node table
local nodes = {
	["gravel_stonebrick"] = {
		description = "Gravel on Stonebrick",
		tiles = {
			"default_gravel.png",
			"default_stone_brick.png",
			"default_gravel.png^[lowpart:50:default_stone_brick.png",
			"default_gravel.png^[lowpart:50:default_stone_brick.png",
			"default_gravel.png^[lowpart:50:default_stone_brick.png",
			"default_gravel.png^[lowpart:50:default_stone_brick.png"
		},
		no_stairs = true,
		groups = {cracky = 3},
		sounds = sound_gravel,
	}
}

for name, def in pairs(nodes) do
	minetest.register_node(":moreblocks:" .. name, def)
	stairsplus:register_all("moreblocks", name,  "moreblocks:" .. name, def)
end
