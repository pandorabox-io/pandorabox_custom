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
