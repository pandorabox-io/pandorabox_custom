
-- space
skybox.register({
	name = "space",
	miny = 1000,
	maxy = 5000,
	textures = {"space_sky.png","space_sky2.png","space_sky.png","space_sky.png","space_sky.png","space_sky.png"}
})

-- moon
skybox.register({
	name = "moon",
	miny = 5001,
	maxy = 6000,
	always_day = true,
	textures = {"space_sky.png","space_sky.png","space_sky.png","space_sky.png","space_sky.png","space_sky.png"}
})


-- deep space
skybox.register({
	-- https://github.com/Ezhh/other_worlds/blob/master/skybox.lua
	name = "deepspace",
	miny = 6001,
	maxy = 10999,
	always_day = true,
	fly = true,
	textures = {
		"sky_pos_z.png",
		"sky_neg_z.png^[transformR180",
		"sky_neg_y.png^[transformR270",
		"sky_pos_y.png^[transformR270",
		"sky_pos_x.png^[transformR270",
		"sky_neg_x.png^[transformR90"
	}
})


-- earth caves
skybox.register({
	name = "earth_cave",
	miny = -32000,
	maxy = -50,
	gravity = 1,
	sky_type = "plain",
	sky_color = {r=0, g=0, b=0}
})
