-- protection related privs
-- for the area- or -priv-protector

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

-- pseudo-server
minetest.register_privilege("spawn_builder", {
        description = "Can build at spawn"
})

-- technic city
minetest.register_privilege("protect_technic_city_infra", {
        description = "Protection for technic city infrastructure"
})
