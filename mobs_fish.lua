-- Add extra areas where fish spawn

local l_spawn_chance = 10000
local l_water_level = minetest.settings:get("water_level")
local l_max_height_Earth = 777 -- Vacuum sometimes extends well below 1k
local l_max_height_Mars = 15777
local l_min_height_Mars = 11111

-- Extend Earth
mobs:spawn({
	name = "mobs_fish:clownfish",
	nodes = {
		"default:water_source", "default:water_flowing",
		"default:river_water_source", "default:river_water_flowing"
	},
	neighbors =  {"default:sand","default:dirt","group:seaplants","group:seacoral"},
	min_light = 5,
	interval = 30,
	chance = l_spawn_chance,
	max_height = l_max_height_Earth,
	min_height = l_water_level,
	active_object_count = 5
})


mobs:spawn({
	name = "mobs_fish:tropical",
	nodes = {
		"default:water_source", "default:water_flowing",
		"default:river_water_source", "default:river_water_flowing"
	},
	neighbors =  {"default:sand","default:dirt","group:seaplants","group:seacoral"},
	min_light = 5,
	interval = 30,
	chance = l_spawn_chance,
	max_height = l_max_height_Earth,
	min_height = l_water_level,
	active_object_count = 5
})


-- Extend Mars
mobs:spawn({
	name = "mobs_fish:clownfish",
	nodes = {
		"default:water_source", "default:water_flowing",
		"default:river_water_source", "default:river_water_flowing"
	},
	neighbors =  {"default:sand","default:dirt","group:seaplants","group:seacoral"},
	min_light = 5,
	interval = 30,
	chance = l_spawn_chance,
	max_height = l_max_height_Mars,
	min_height = l_min_height_Mars,
	active_object_count = 5
})


mobs:spawn({
	name = "mobs_fish:tropical",
	nodes = {
		"default:water_source", "default:water_flowing",
		"default:river_water_source", "default:river_water_flowing"
	},
	neighbors =  {"default:sand","default:dirt","group:seaplants","group:seacoral"},
	min_light = 5,
	interval = 30,
	chance = l_spawn_chance,
	max_height = l_max_height_Mars,
	min_height = l_min_height_Mars,
	active_object_count = 5
})
