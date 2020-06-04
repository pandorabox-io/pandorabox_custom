
-- jumpdrive
minetest.register_privilege("jumpdrive_land", {
	description = "Can jump down to earth",
	give_to_singleplayer = false
})


-- onplace override
minetest.register_privilege("bypass_onplace_restriction", {
	description = "Can place stuff without onplace restrictions",
	give_to_singleplayer = false
})
