
local S = minetest.get_translator("farming")

-- Dough craftitem
minetest.register_craftitem(":farming:dough", {
	description = "Dough",
	inventory_image = "farming_dough.png",
})

-- Swap farming/default blueberry names
-- default:blueberries should be wild, because they grow on bushes,
-- and farming:blueberries should not be wild because they grow as a small plant.
-- See: https://github.com/pandorabox-io/pandorabox-mods/pull/997
local wild_desc = minetest.registered_craftitems["farming:blueberries"].description
local desc = minetest.registered_craftitems["default:blueberries"].description
minetest.override_item("default:blueberries", {
	description = wild_desc
})
minetest.override_item("farming:blueberries", {
	description = desc
})

-- Undo change to rhubarb light values
-- See https://github.com/pandorabox-io/pandorabox-mods/pull/1235
if farming.registered_plants["farming:rhubarb"] then
	for i=1,3 do
		minetest.override_item("farming:rhubarb_"..i, {
			minlight = 12,
			maxlight = 15,
		})
	end
	farming.registered_plants["farming:rhubarb"].minlight = 12
	farming.registered_plants["farming:rhubarb"].maxlight = 15
end

-- Undo change to cocoa
-- Although it's more realistic, it also makes all existing cocoa unplantable
local place_cocoa = minetest.registered_craftitems["farming:cocoa_beans_raw"].on_place
minetest.override_item("farming:cocoa_beans", {
	groups = {seed = 2, food_cocoa = 1, flammable = 2},
	on_place = place_cocoa,
})
minetest.override_item("farming:cocoa_3", {
	drop = {
		items = {
			{items = {"farming:cocoa_beans 1"}, rarity = 1}
		}
	}
})
minetest.override_item("farming:cocoa_4", {
	drop = {
		items = {
			{items = {"farming:cocoa_beans 2"}, rarity = 1},
			{items = {"farming:cocoa_beans 1"}, rarity = 2},
			{items = {"farming:cocoa_beans 1"}, rarity = 4}
		}
	}
})
minetest.clear_craft({
	type = "cooking",
	recipe = "farming:cocoa_beans_raw",
})
farming.registered_plants["farming:cocoa_beans"].seed = "farming:cocoa_beans"
minetest.register_alias_force("farming:cocoa_beans_raw", "farming:cocoa_beans")

-- Re-add peas and soy beans
minetest.register_craftitem(":farming:peas", {
	description = S("Peas"),
	inventory_image = "farming_pea_peas.png",
	groups = {seed = 1, food_peas = 1, flammable = 2},
	on_use = minetest.item_eat(1),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:pea_1")
	end,
})
minetest.override_item("farming:pea_pod", {
	groups = {food_pea_pod = 1, flammable = 2},
	on_use = nil,
	on_place = nil,
})
minetest.register_craftitem(":farming:soy_beans", {
	description = S("Soy Beans"),
	inventory_image = "farming_soy_beans.png",
	groups = {seed = 1, food_soy = 1, flammable = 2},
	on_use = minetest.item_eat(-2),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:soy_1")
	end,
})
minetest.override_item("farming:soy_pod", {
	groups = {food_soy_pod = 1, flammable = 2},
	on_place = nil,
})
minetest.register_craft({
	output = "farming:peas",
	recipe = {{"farming:pea_pod"}}
})
minetest.register_craft({
	output = "farming:soy_beans",
	recipe = {{"farming:soy_pod"}}
})
farming.registered_plants["farming:pea_pod"].seed = "farming:peas"
farming.registered_plants["farming:soy_pod"].seed = "farming:soy_beans"

-- Add peas and soy beans to seeder list
if minetest.get_modpath("farming_nextgen") then
	table.insert(farmingNG.seeder_seed, {"farming:soy_beans", "farming:soy_1"})
	table.insert(farmingNG.seeder_seed, {"farming:peas", "farming:pea_1"})
end

-- Adjust pie nutrition and recipe output to match new textures
minetest.override_item("farming:apple_pie", {
	on_use = minetest.item_eat(1)
})
minetest.override_item("farming:blueberry_pie", {
	on_use = minetest.item_eat(1)
})
minetest.override_item("farming:rhubarb_pie", {
	on_use = minetest.item_eat(1)
})
minetest.clear_craft({output = "farming:apple_pie"})
minetest.clear_craft({output = "farming:blueberry_pie"})
minetest.clear_craft({output = "farming:rhubarb_pie"})
minetest.register_craft({
	output = "farming:apple_pie 8",
	recipe = {
		{"group:food_flour", "group:food_sugar", "group:food_apple"},
		{"", "group:food_baking_tray", ""}
	},
	replacements = {{"group:food_baking_tray", "farming:baking_tray"}}
})
minetest.register_craft({
	output = "farming:blueberry_pie 8",
	recipe = {
		{"group:food_flour", "group:food_sugar", "group:food_blueberries"},
		{"group:food_baking_tray", "", ""}
	},
	replacements = {{"group:food_baking_tray", "farming:baking_tray"}}
})
minetest.register_craft({
	output = "farming:rhubarb_pie 8",
	recipe = {
		{"farming:baking_tray", "group:food_sugar", ""},
		{"group:food_rhubarb", "group:food_rhubarb", "group:food_rhubarb"},
		{"group:food_wheat", "group:food_wheat", "group:food_wheat"}
	},
	replacements = {{"group:food_baking_tray", "farming:baking_tray"}}
})
