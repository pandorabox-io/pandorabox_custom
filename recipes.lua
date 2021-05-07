
if minetest.get_modpath("ccompass") and minetest.get_modpath("digtron") then
	-- redefine ccompass recipe
	minetest.clear_craft({ output = 'ccompass:0' })
	minetest.register_craft({
		output = 'ccompass:0',
		recipe = {
			{'default:stick', 'default:steel_ingot', ''},
			{'default:steel_ingot', 'default:mese_crystal_fragment', 'default:steel_ingot'},
			{'', 'default:steel_ingot', 'default:stick'}
		}
	})
end

if minetest.get_modpath("mypaths") then
	-- fake grass collides with compressed dirt
	-- changing fake grass recipe
	minetest.clear_craft({ output = "mypaths:grass" })
	minetest.register_craft({
		output = "mypaths:grass 9",
		recipe = {
			{"default:grass_1", "default:grass_1","default:grass_1"},
			{"default:grass_1", "default:dirt","default:grass_1"},
			{"default:grass_1", "default:grass_1","default:grass_1"},
		}
	})
end

if minetest.get_modpath("charcoal") then
	-- charcoal / tar clash
	minetest.clear_craft({ output = "charcoal:charcoal_lump" })
	minetest.register_craft({
	        output = "charcoal:charcoal_lump 4",
	        type = "cooking",
	        recipe = "group:wood",
		cooktime = 4
	})

	-- "manual" craft for https://github.com/pandorabox-io/pandorabox.io/issues/291
	minetest.register_craft({
	        output = "dye:black",
		recipe = {
			{'charcoal:charcoal_lump', 'charcoal:charcoal_lump', 'charcoal:charcoal_lump'},
			{'charcoal:charcoal_lump', 'charcoal:charcoal_lump', 'charcoal:charcoal_lump'},
			{'charcoal:charcoal_lump', 'charcoal:charcoal_lump', 'charcoal:charcoal_lump'}
		}
	})
end

if minetest.get_modpath("castle_weapons") then
	minetest.clear_craft({ output = "castle_weapons:crossbow_bolt" })
	minetest.register_craft({
		output = "castle_weapons:crossbow_bolt 6",
		recipe = {
			{'default:stick', 'default:stick', 'default:steel_ingot'},
			{'default:stick', '', ''},
			{'', '', ''}
		}
	})

end

-- book renewal
minetest.register_craft({
        type = "shapeless",
        output = "default:book",
        recipe = {"default:book_written", "default:paper"}
})

if minetest.get_modpath("moreblocks") and minetest.get_modpath("bakedclay") then
	-- moreblocks stick recipe conflicts with bakedclay dye recipe for default:dry_shrub
	-- https://github.com/pandorabox-io/pandorabox.io/issues/414
	minetest.clear_craft({
		recipe = {{"default:dry_shrub"}}
	})

	minetest.register_craft({
	        type = "shapeless",
	        output = "dye:brown",
	        recipe = {"default:dry_shrub"}
	})
end

-- Updated bread recipes.
--
-- We are using yeast in beer for cooking more of it.
-- Beer does contain live yeast sometimes; nowadays it can be removed,
-- but generally that's how it is.
--
-- Optionally, we add more sugar for yeast to eat.
-- It makes 11 bread instead of 9.
--
-- Recipe also requires salt.
if minetest.get_modpath("farming") then
	if minetest.get_modpath("wine") then
		minetest.register_craft({
			type = "shapeless",
			output = 'farming:dough 9',
			recipe = {'farming:flour', 'wine:glass_beer', 'farming:salt'},
		})
		minetest.register_craft({
			type = "shapeless",
			output = 'farming:dough 11',
			recipe = {
				'farming:flour', 'wine:glass_beer', 'farming:salt',
				'farming:sugar'
			},
		})
		minetest.register_craft({
			type = "shapeless",
			output = 'farming:dough 9',
			recipe = {'farming:flour', 'wine:glass_wheat_beer', 'farming:salt'},
		})
		minetest.register_craft({
			type = "shapeless",
			output = 'farming:dough 11',
			recipe = {
				'farming:flour', 'wine:glass_wheat_beer', 'farming:salt',
				'farming:sugar'
			},
		})
	end
	if minetest.get_modpath("homedecor_gastronomy") then
		minetest.register_craft({
			type = "shapeless",
			output = 'farming:dough 9',
			recipe = {'farming:flour', 'homedecor:beer_mug', 'farming:salt'},
			replacements = {
				{"homedecor:beer_mug", "vessels:drinking_glass"}
			}
		})
		minetest.register_craft({
			type = "shapeless",
			output = 'farming:dough 11',
			recipe = {
				'farming:flour', 'homedecor:beer_mug', 'farming:salt',
				'farming:sugar'
			},
			replacements = {
				{"homedecor:beer_mug", "vessels:drinking_glass"}
			}
		})
	end
	-- Cooking dough to bread
	minetest.register_craft({
		type = "cooking",
		cooktime = 15,
		output = "farming:bread",
		recipe = "farming:dough"
	})
end

-- Update for dry dirt and a dirt road recipe.
-- Dirt road should be harder than simple dried dirt.
if minetest.get_modpath("mypaths") and minetest.get_modpath("technic") then
	minetest.clear_craft({ output = 'mypaths:dirt_road' })
	minetest.register_craft({
		output = "default:dry_dirt",
		type = "cooking",
		recipe = "default:dirt",
		cooktime = 4
	})
	technic.register_compressor_recipe({
		input = {"default:dry_dirt 2"},
		output = "mypaths:dirt_road"
	})
end

-- Add recipes for silver and mithril hoes
-- moreoes does not add recipes due to "rare material" hoes being removed from Minetest Game:
-- https://github.com/minetest-mods/moreores/blob/3fe0ba8fcb3a19222c23c0d1b01a671df43d655c/init.lua#L219-L222
if minetest.get_modpath("farming") and minetest.get_modpath("moreores") then
	minetest.register_craft({
		output = "moreores:hoe_silver",
		recipe = {
			{"moreores:silver_ingot", "moreores:silver_ingot", ""},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
	minetest.register_craft({
		output = "moreores:hoe_mithril",
		recipe = {
			{"moreores:mithril_ingot", "moreores:mithril_ingot", ""},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
end

-- Recipes for converting between pipeworks injector variants
-- https://github.com/pandorabox-io/pandorabox.io/issues/622
if minetest.get_modpath("pipeworks") then
	minetest.register_craft({
		output = "pipeworks:filter",
		recipe = {{"pipeworks:mese_filter", "default:mese_crystal"}},
		replacements = {{"pipeworks:mese_filter", "default:mese"}}
	})
	minetest.register_craft({
		output = "pipeworks:mese_filter",
		recipe = {{"pipeworks:filter", "default:mese"}},
		replacements = {{"pipeworks:filter", "default:mese_crystal"}}
	})
	if minetest.get_modpath("digilines") then
		minetest.register_craft({
			output = "pipeworks:digiline_filter",
			recipe = {{"pipeworks:mese_filter", "digilines:wire_std_00000000"}},
			replacements = {{"pipeworks:mese_filter", "default:mese"}}
		})
		minetest.register_craft({
			output = "pipeworks:digiline_filter",
			recipe = {{"pipeworks:filter", "digilines:wire_std_00000000"}},
			replacements = {{"pipeworks:filter", "default:mese_crystal"}}
		})
		minetest.register_craft({
			output = "pipeworks:filter",
			recipe = {{"pipeworks:digiline_filter", "default:mese_crystal"}},
			replacements = {{"pipeworks:digiline_filter", "digilines:wire_std_00000000"}}
		})
		minetest.register_craft({
			output = "pipeworks:mese_filter",
			recipe = {{"pipeworks:digiline_filter", "default:mese"}},
			replacements = {{"pipeworks:digiline_filter", "digilines:wire_std_00000000"}}
		})
	end
end

-- craft recipes for digilines rtc and lightsensor
if minetest.get_modpath("digilines") and minetest.get_modpath("basic_materials") then
	minetest.register_craft({
		output = "digilines:rtc",
		recipe = {
			{"basic_materials:plastic_sheet", "default:mese_crystal_fragment", "basic_materials:plastic_sheet"},
			{"dye:black", "basic_materials:ic", "dye:black"},
			{"basic_materials:plastic_sheet", "digilines:wire_std_00000000", "basic_materials:plastic_sheet"}
		}
	})
	minetest.register_craft({
		output = "digilines:lightsensor",
		recipe = {
			{"basic_materials:plastic_sheet", "default:glass", "basic_materials:plastic_sheet"},
			{"basic_materials:plastic_sheet", "basic_materials:ic", "basic_materials:plastic_sheet"},
			{"basic_materials:plastic_sheet", "digilines:wire_std_00000000", "basic_materials:plastic_sheet"}
		}
	})
end
