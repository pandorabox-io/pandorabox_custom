
-- privileges for various height layers

minetest.register_privilege("moon_access", {
	description = "Can travel to the moon",
	otp_keep = true
})

minetest.register_privilege("asteroids_access", {
	description = "Can travel to the asteroid belt",
	otp_keep = true
})

minetest.register_privilege("mars_access", {
	description = "Can travel to Mars",
	otp_keep = true
})

minetest.register_privilege("warzone_access", {
	description = "Can travel to the warzone",
	otp_keep = true
})
