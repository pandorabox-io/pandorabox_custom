
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
end

-- Cooking dough to bread
minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:bread",
	recipe = "farming:dough"
})

-- Update for dry dirt and a dirt road recipe.
-- Dirt road should be harder than simple dried dirt.
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
