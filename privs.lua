
-- common/public

minetest.register_privilege("protect_streets", {
	description = "Protection for common streets"
})

minetest.register_privilege("protect_rails", {
	description = "Protection for common rails/trainlines"
})

minetest.register_privilege("protect_public_places", {
	description = "Protection for common public places"
})

minetest.register_privilege("protect_public_infrastructure", {
        description = "Protection for common public infrastructure (machines, etc)"
})

-- pseudo-server
minetest.register_privilege("server_control", {
        description = "Can operate the server command center"
})


-- specific privs

minetest.register_privilege("protect_technic_city_infra", {
        description = "Protection for technic city infrastructure"
})

-- player fly
minetest.register_privilege("player_fly", {
	description = "can always fly",
	give_to_singleplayer = false
})

-- player fly event
minetest.register_privilege("fly_event", {
	description = "can toggle global fly event"
})

-- no announcements for the player
minetest.register_privilege("no_announce", {
        description = "player does not get announced",
	give_to_singleplayer = false
})


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
