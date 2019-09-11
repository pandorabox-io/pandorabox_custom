
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

