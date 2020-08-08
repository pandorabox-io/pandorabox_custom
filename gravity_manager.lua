
-- space
gravity_manager.register({
	miny = 1000,
	maxy = 5000,
	gravity = 0.8
})

-- moon
gravity_manager.register({
	miny = 5001,
	maxy = 6000,
	gravity = 0.1654
})

-- deep space
gravity_manager.register({
	miny = 6001,
	maxy = 10999,
	gravity = 0.1
})
