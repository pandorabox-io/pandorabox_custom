
-- player fly
minetest.register_privilege("player_fly", {
	description = "can always fly",
	give_to_singleplayer = false
})

-- player fly event
minetest.register_privilege("fly_event", {
	description = "can toggle global fly event"
})
