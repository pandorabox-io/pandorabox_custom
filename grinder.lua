
-- 2018-09-18
-- cotton seed to flour

technic.register_grinder_recipe({
	input = {"farming:seed_cotton"},
	output = "farming:flour 1"
})


-- 2x bonemeal recipes
-- see https://github.com/pandorabox-io/pandorabox-mods/pull/2960

technic.register_grinder_recipe({
	input = {"bones:bones"},
	output = "bonemeal:bonemeal 8"
})
technic.register_grinder_recipe({
	input = {"bonemeal:bone"},
	output = "bonemeal:bonemeal 4"
})
technic.register_grinder_recipe({
	input = {"default:coral_skeleton"},
	output = "bonemeal:bonemeal 4"
})
