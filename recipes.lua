
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
