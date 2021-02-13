
-- half gravel, half stonebrick
minetest.register_node(":moreblocks:gravel_stonebrick", {
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
	sounds = default.node_sound_gravel_defaults()
})

stairsplus:register_all(
	"moreblocks",
	"gravel_stonebrick",
	"moreblocks:gravel_stonebrick",
	minetest.registered_nodes["moreblocks:gravel_stonebrick"]
)

minetest.register_craft({
    output = "moreblocks:gravel_stonebrick 4",
    recipe = {
        {"default:gravel", "default:gravel"},
        {"default:stonebrick", "default:stonebrick"},
    }
})
