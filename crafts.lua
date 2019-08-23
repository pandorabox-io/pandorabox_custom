-- 2018-08-08 cookable stairs
minetest.register_craft({
	type = "cooking",
	output = "moreblocks:stair_stone",
	recipe = "moreblocks:stair_cobble",
})



-- 2018-09-07 dye fix
-- https://github.com/h-v-smacker/technic/blob/master/technic/machines/register/recipe_defusing.lua#L49

local dyes = {
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}

for i = 1, #dyes do
	local name, _, craft_color_group = unpack(dyes[i])
	minetest.register_craft{
		type = "shapeless",
		output = "wool:" .. name,
		recipe = {"group:dye," .. craft_color_group, "group:wool"},
	}
end




-- 2018-09-07
-- bronze block to ingots
minetest.register_craft({
	type = "shapeless",
	output = 'default:bronze_ingot 9',
	recipe = {
		'default:bronzeblock'
	}
})




-- 2019-08-12
-- sand/sandstone dyeing recipes

local sands = {
	{"default:sand", "dye:white"},
	{"default:silver_sand", "dye:grey"},
	{"default:desert_sand", "dye:brown"}
}

for i = 1, #sands do
	local output_sand, dye = unpack(sands[i])
	for j = 1, #sands do
		local input_sand, _ = unpack(sands[i])
		if input_sand ~= output_sand then
			minetest.register_craft({
				output = output_sand .. " 8",
				recipe = {
					{input_sand, input_sand, input_sand},
					{input_sand, dye, input_sand},
					{input_sand, input_sand, input_sand}
				},
			})
		end
	end
end


local sandstones = {
	{"default:sandstone", "dye:white"},
	{"default:silver_sandstone", "dye:grey"},
	{"default:desert_sandstone", "dye:brown"}
}

for i = 1, #sandstones do
	local output_sandstone, dye = unpack(sandstones[i])
	for j = 1, #sandstones do
		local input_sandstone, _ = unpack(sandstones[i])
		if input_sandstone ~= output_sandstone then
			minetest.register_craft({
				output = output_sandstone .. " 4",
				recipe = {
					{"", input_sandstone, ""},
					{input_sandstone, dye, input_sandstone},
					{"", input_sandstone, ""}
				},
			})
		end
	end
end
