-- add extra areas where fish spawn

local l_spawn_chance = 10000
local l_water_level = minetest.settings:get("water_level")
local l_max_height = 16999 -- or 17999 if we want to include warzone

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
	max_height = l_max_height,
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
	max_height = l_max_height,
	min_height = l_water_level,
	active_object_count = 5
})

