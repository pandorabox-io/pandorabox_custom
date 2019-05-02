
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

-- travel

minetest.register_privilege("admin_travel", {
        description = "can use the admins travelnets"
})

-- specific privs

minetest.register_privilege("protect_technic_city_infra", {
        description = "Protection for technic city infrastructure"
})

-- player fly
minetest.register_privilege("skybox_fly", {
	description = "can always fly"
})
