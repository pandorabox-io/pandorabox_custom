
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
