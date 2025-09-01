
-- 2018-08-08 cookable stairs

core.register_craft({
	type = "cooking",
	output = "moreblocks:stair_stone",
	recipe = "moreblocks:stair_cobble",
})



-- 2018-09-07 dye fix
-- https://github.com/h-v-smacker/technic/blob/master/technic/machines/register/recipe_defusing.lua#L49

local dyes = {
	{ "violet",     "Violet",     "excolor_violet" },
	{ "brown",      "Brown",      "unicolor_dark_orange" },
	{ "pink",       "Pink",       "unicolor_light_red" },
	{ "dark_grey",  "Dark Grey",  "unicolor_darkgrey" },
	{ "dark_green", "Dark Green", "unicolor_dark_green" },
}

for i = 1, #dyes do
	local name, _, craft_color_group = unpack(dyes[i])
	core.register_craft{
		type = "shapeless",
		output = "wool:" .. name,
		recipe = { "group:dye," .. craft_color_group, "group:wool" },
	}
end



-- 2018-09-07
-- bronze block to ingots

core.register_craft({
	type = "shapeless",
	output = 'default:bronze_ingot 9',
	recipe = {
		'default:bronzeblock'
	}
})



-- 2019-08-12
-- sand/sandstone dyeing recipes

local sands = {
	{ "default:sand", "dye:white" },
	{ "default:silver_sand", "dye:grey" },
	{ "default:desert_sand", "dye:brown" }
}

for i = 1, #sands do
	local output_sand, dye = unpack(sands[i])
	for j = 1, #sands do
		local input_sand, _ = unpack(sands[j])
		if input_sand ~= output_sand then
			core.register_craft({
				output = output_sand .. " 8",
				recipe = {
					{ input_sand, input_sand, input_sand },
					{ input_sand, dye, input_sand },
					{ input_sand, input_sand, input_sand }
				},
			})
		end
	end
end

local sandstones = {
	{ "default:sandstone", "dye:white" },
	{ "default:silver_sandstone", "dye:grey" },
	{ "default:desert_sandstone", "dye:brown" }
}

for i = 1, #sandstones do
	local output_sandstone, dye = unpack(sandstones[i])
	for j = 1, #sandstones do
		local input_sandstone, _ = unpack(sandstones[j])
		if input_sandstone ~= output_sandstone then
			core.register_craft({
				output = output_sandstone .. " 4",
				recipe = {
					{ "", input_sandstone, "" },
					{ input_sandstone, dye, input_sandstone },
					{ "", input_sandstone, "" }
				},
			})
		end
	end
end



-- 2019-12-22
-- dirt with dry grass crafting

core.register_craft({
	output = "default:dry_dirt_with_dry_grass",
	type = "shapeless",
	recipe = { "default:dry_grass_1", "default:dry_dirt" },
})

core.register_craft({
	output = "default:dirt_with_dry_grass",
	type = "shapeless",
	recipe = { "default:dry_grass_1", "default:dirt" },
})



-- 2020-10-21
-- last updated 2025-05-30
-- cookable tools and armor

-- format is {recipe, output[, replacement]}

local cookable_items = { --DRAWER UPGRADE, BRIDGER
	{ "farming:scythe_mithril", "moreores:mithril_ingot 3" },
	{ "multitools:multitool_mithril", "moreores:mithril_ingot 9" },
	{ "wrench:wrench", "technic:stainless_steel_ingot 4" },
	{ "default:screwdrvier", "default:steel_ingot 1" },
	{ "farming:cutting_board", "default:steel_ingot 1" },
	{ "spacesuit:helmet", "default:steel_ingot 14" },
	{ "spacesuit:pants", "default:steel_ingot 4" },
	{ "spacesuit:boots", "default:steel_ingot 15" },
	{ "signs_road:blue_street_sign", "default:steel_ingot 1" },      -- floor(6 in / 4 out) = 1
	{ "homedecor:trash_can", "default:steel_ingot 1" },              -- floor(4+0.5*2 in / 3 out) = floor(4 in / 3 out) = 1
	{ "castle_gates:steel_gate_panel", "default:steel_ingot 2" },     -- (int div shorthand) 18 in // 8 out
	{ "castle_gates:steel_gate_hinge", "default:steel_ingot 2" },     -- 62 in // 24 out
	{ "advtrains:signal_off", "default:steel_ingot 1" },             -- 3 in // 2 out
	{ "advtrains:signal_wall_r_off", "default:steel_ingot 2" },      -- 5 in // 2 out
	{ "advtrains_signals_ks:hs_danger_0", "default:steel_ingot 2" }, -- 5.2 in // 2 out
	{ "advtrains_signals_ks:ra_danger_0", "default:steel_ingot 2" }, -- 4.2 in // 2 out
	{ "advtrains_signals_ks:zs3_off_0", "default:steel_ingot 1" },   -- 3.2 in // 2 out
	{ "advtrains_signals_ks:zs3v_off_0", "default:steel_ingot 1" },  -- 3.2 in // 2 out
	-- iron sign (6 in // 4 out)
		{ "default:sign_wall_steel", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_blue", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_brown", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_green", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_orange", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_red", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_yellow", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_white_black", "default:steel_ingot 1" },
		{ "basic_signs:sign_wall_steel_white_red", "default:steel_ingot 1" },
		{ "signs_road:blue_street_sign", "default:steel_ingot 1" },
	-- street signs (3 in // 2 out)
		{ "signs_road:black_right_sign", "default:steel_ingot 1" },
		{ "signs_road:red_street_sign", "default:steel_ingot 1" },

		{ "signs_road:signs_road:red_right_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:green_right_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:blue_right_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:yellow_right_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:white_right_sign", "default:steel_ingot 1" },

		{ "signs_road:signs_road:red_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:green_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:blue_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:yellow_sign", "default:steel_ingot 1" },
		{ "signs_road:signs_road:white_sign", "default:steel_ingot 1" },
	{ "more_chests:toolbox_steel", "default:steel_ingot 8" },        -- pickaxe of unknown material
	{ "bike:bike", "default:steel_ingot 7" },
	{ "signs_road:large_street_sign", "default:steel_ingot 6" },
	{ "pipeworks_elbow:pipeworks_elbow", "default:steel_ingot 6" },
	{ "letters:letter_cutter_upper", "default:steel_ingot 2" },
	{ "letters:letter_cutter_lower", "default:steel_ingot 1" },
	{ "fire:flint_and_steel", "default:steel_ingot 1" },
	{ "more_chests:shared", "default:steel_ingot 1" },
	{ "pipeworks:storage_tank_0", "default:steel_ingot 3" },
	{ "advtrains:chimney", "default:steel_ingot 3" },
	{ "bucket:bucket_empty", "default:steel_ingot 3" },
	{ "more_chests:cobble", "default:steel_ingot 1" },
	{ "homedecor:shower_head", "default:steel_ingot 4" },
	{ "pipeworks:steel_block_embedded_tube", "default:steel_ingot 8" },
	{ "farming:skillet", "default:steel_ingot 2" },
	{ "ilights:light_on", "default:steel_ingot 1" },
	{ "castle_weapons:battleaxe", "default:steel_ingot 5" },
	{ "advtrains:retrosignal_off", "default:steel_ingot 2" },
	{ "morelights_modern:streetpost_d", "default:steel_ingot 2" },
	{ "framedglass:steel_framed_obsidian_glass", "default:steel_ingot 1" },
	{ "prefab:electric_fence_end", "default:steel_ingot 1" },
	{ "prefab:electric_fence", "default:steel_ingot 1" },
	{ "prefab:electric_fence_corner", "default:steel_ingot 1" },
	{ "carts:cart", "default:steel_ingot 5" },
	{ "home_workshop_misc:beer_tap", "default:steel_ingot 6" },
	{ "pipeworks:steel_pane_embedded_tube", "default:steel_ingot 2" },
	{ "anvil:anvil", "default:steel_ingot 7" },
	{ "anvil:hammer", "default:steel_ingot 6" },
	{ "3d_armor_stand:armor_stand", "default:steel_ingot 3" },
	{ "3d_armor_stand:locked_armor_stand", "default:steel_ingot 4" },
	{ "3d_armor_stand:shared_armor_stand", "default:steel_ingot 3" },
	{ "mobs:horseshoe_bronze", "default:bronze_ingot 13" },
	{ "mobs:horseshoe_steel", "default:steel_ingot 13" },
	{ "jumping:trampoline1", "default:steel_ingot 2" },
	{ "more_chests:fridge", "default:steel_ingot 4" },
	{ "more_chests:big_fridge", "default:steel_ingot 8" },
}

local tool_materials = {
	["wood"] = { "charcoal:charcoal_lump", 4 },
	["stone"] = { "default:stone", 1 },
	["steel"] = { "default:steel_ingot", 1 },
	["bronze"] = { "default:bronze_ingot", 1 },
	["silver"] = { "moreores:silver_ingot", 1, "moreores" },
	["mithril"] = { "moreores:mithril_ingot", 1, "moreores" },
}

-- assume mese unmeltable unless mesecons_wires exists
if core.get_modpath("mesecons_wires") then
	tool_materials["mese"] = { "mesecons:wire_00000000_off", 18 }
	table.insert(cookable_items, {
		"multitools:multitool_mese", "mesecons:wire_00000000_off 162"
	})
	table.insert(cookable_items, {
		"mobs:horseshoe_mese", "mesecons:wire_00000000_off 170"
	})
end

local tool_items = {
	["hoe"] = 2, ["shovel"] = 1, ["sword"] = 2, ["axe"] = 3, ["pick"] = 3
}

for m, v in pairs(tool_materials) do
	for t, q in pairs(tool_items) do
		if not (m == "bronze" and t == "hoe") then
			local n = v[3] or (t == "hoe" and "farming" or "default")
			table.insert(cookable_items, {
				n .. ":" .. t .. "_" .. m,
				v[1] .. " " .. (v[2] * q)
			})
		end
	end
end

local armor_materials = {
	["wood"] = { "charcoal:charcoal_lump", 4 },
	["steel"] = { "default:steel_ingot", 1 },
	["bronze"] = { "default:bronze_ingot", 1 },
	["gold"] = { "default:gold_ingot", 1 },
	["mithril"] = { "moreores:mithril_ingot", 1},
	["brass"] = { "basic_materials:brass_ingot", 1, "technic_armor" },
	["carbon"] = { "default:steel_ingot", 1, "technic_armor" },
	["cast"] = { "default:steel_ingot", 1, "technic_armor" },
	["lead"] = { "technic:lead_ingot", 1, "technic_armor" },
	["silver"] = { "moreores:silver_ingot", 1, "technic_armor" },
	["stainless"] = { "technic:stainless_steel_ingot", 1, "technic_armor" },
	["tin"] = { "default:tin_ingot", 1, "technic_armor" },
}

local armor_items = {
	["boots"] = 4, ["chestplate"] = 8, ["helmet"] = 5,
	["leggings"] = 7, ["shield"] = 7
}

for m, v in pairs(armor_materials) do
	for t, q in pairs(armor_items) do
		local n = v[3] or (t == "shield" and "shields" or "3d_armor")
		table.insert(cookable_items, {
			n .. ":" .. t .. "_" .. m,
			v[1] .. " " .. (v[2] * q)
		})
	end
end

for _, v in pairs(cookable_items) do
	local def = {
		type = "cooking",
		output = v[2],
		recipe = v[1],
	}
	core.register_craft(def)
end

