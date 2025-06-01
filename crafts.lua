
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
		local input_sand, _ = unpack(sands[j])
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
		local input_sandstone, _ = unpack(sandstones[j])
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



-- 2019-12-22
-- dirt with dry grass crafting

minetest.register_craft({
	output = "default:dry_dirt_with_dry_grass",
	type = "shapeless",
	recipe = {"default:dry_grass_1", "default:dry_dirt"},
})

minetest.register_craft({
	output = "default:dirt_with_dry_grass",
	type = "shapeless",
	recipe = {"default:dry_grass_1", "default:dirt"},
})



-- 2020-10-21
-- last updated 2025-05-30
-- cookable tools and armor

-- format is {recipe, output[, replacement]}

local cookable_items = {
	{"farming:scythe_mithril", "moreores:mithril_ingot 3"},
	{"multitools:multitool_mithril", "moreores:mithril_ingot 9"},
	{"wrench:wrench", "technic:stainless_steel_ingot 4"},
	{"anvil:anvil", "default:steel_ingot 7"},
	{"anvil:hammer", "default:steel_ingot 6"},
	{"3d_armor_stand:armor_stand", "default:steel_ingot 3"},
	{"3d_armor_stand:locked_armor_stand", "default:steel_ingot 4"},
	{"3d_armor_stand:shared_armor_stand", "default:steel_ingot 3", "default:copper_ingot"},
}

local tool_materials = {
	["wood"] = {"charcoal:charcoal_lump", 4},
	["stone"] = {"default:stone", 1},
	["steel"] = {"default:steel_ingot", 1},
	["bronze"] = {"default:bronze_ingot", 1},
	["silver"] = {"moreores:silver_ingot", 1, "moreores"},
	["mithril"] = {"moreores:mithril_ingot", 1, "moreores"},
}

-- assume mese unmeltable unless mesecons_wires exists
if minetest.get_modpath("mesecons_wires") then
	tool_materials["mese"] = { "mesecons:wire_00000000_off", 18 }
	table.insert(cookable_items, {
		"multitools:multitool_mese", "mesecons:wire_00000000_off 162"
	})
end

local tool_items = {["hoe"] = 2, ["shovel"] = 1, ["sword"] = 2, ["axe"] = 3, ["pick"] = 3}

for m,v in pairs(tool_materials) do
	for t,q in pairs(tool_items) do
		if not (m == "bronze" and t == "hoe") then
			local n = v[3] or (t == "hoe" and "farming" or "default")
			table.insert(cookable_items, {
				n..":"..t.."_"..m,
				v[1].." "..(v[2] * q)
			})
		end
	end
end

local armor_materials = {
	["wood"] = {"charcoal:charcoal_lump", 4},
	["steel"] = {"default:steel_ingot", 1},
	["bronze"] = {"default:bronze_ingot", 1},
	["gold"] = {"default:gold_ingot", 1},
	["mithril"] = {"moreores:mithril_ingot", 1},
	["brass"] = {"basic_materials:brass_ingot", 1, "technic_armor"},
	["carbon"] = {"default:steel_ingot", 1, "technic_armor"},
	["cast"] = {"default:steel_ingot", 1, "technic_armor"},
	["lead"] = {"technic:lead_ingot", 1, "technic_armor"},
	["silver"] = {"moreores:silver_ingot", 1, "technic_armor"},
	["stainless"] = {"technic:stainless_steel_ingot", 1, "technic_armor"},
	["tin"] = {"default:tin_ingot", 1, "technic_armor"},
}

local armor_items = {["boots"] = 4, ["chestplate"] = 8, ["helmet"] = 5, ["leggings"] = 7, ["shield"] = 7}

for m,v in pairs(armor_materials) do
	for t,q in pairs(armor_items) do
		local n = v[3] or (t == "shield" and "shields" or "3d_armor")
		table.insert(cookable_items, {
			n..":"..t.."_"..m,
			v[1].." "..(v[2] * q)
		})
	end
end

for _,v in pairs(cookable_items) do
	local def = {
		type = "cooking",
		output = v[2],
		recipe = v[1],
	}
	if v[3] then
		def.replacements = {{v[1], v[3]}}
	end
	core.register_craft(def)
end
