
-- make more plants obtainable by mulching
-- junglegrass is used to make many nodes, such as moreblocks:clean_glass
bonemeal:add_deco({
	{ "default:dirt_with_rainforest_litter",
		{"default:junglegrass", ""}, {} }
})

bonemeal:add_deco({
	{ "default:dirt_with_coniferous_litter",
		{}, {"default:fern_1", "default:fern_2", "default:fern_3", "", ""} }
})

bonemeal:add_deco({
	{ "default:sand",
		{"default:marram_grass_1", "default:marram_grass_2", "default:marram_grass_3", "", ""}, {} }
})


-- super fertiliser (strength 4)
-- uses charcoal as a soil amendment
-- https://en.wikipedia.org/wiki/Biochar
if minetest.get_modpath("charcoal") then

	local creative_mode = minetest.settings:get_bool("creative_mode")

	minetest.register_craftitem("pandorabox_custom:super_fertiliser", {
		description = "Super Fertiliser",
		inventory_image = "bonemeal_item.png^[multiply:#00a000ff",
		on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end
			if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
				return
			end
			if not creative_mode or not minetest.check_player_privs(user:get_player_name(), {creative = true}) then
				itemstack:take_item()
			end
			bonemeal:on_use(pointed_thing.under, 4)
			return itemstack
		end
	})

	minetest.register_craft({
		type = "shapeless",
		output = "pandorabox_custom:super_fertiliser",
		recipe = {"bonemeal:fertiliser", "charcoal:charcoal_lump"}
	})
end
