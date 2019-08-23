-- 2019-08-23
-- extract black dye from charcoal

if minetest.get_modpath("charcoal") then
	technic.register_extractor_recipe({
		input = {"charcoal:charcoal_lump"},
		output = "dye:black"
	})
end
