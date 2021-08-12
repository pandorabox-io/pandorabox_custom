
if minetest.get_modpath("mobs_monster") then
	-- Reduce lava orb brightness
	minetest.override_item("mobs:lava_orb", {
		light_source = 4
	})
end

if minetest.get_modpath("lavastuff") then
	-- Reduce armor brightness
	minetest.override_item("lavastuff:helmet_lava", {
		light_source = 4
	})
	minetest.override_item("lavastuff:chestplate_lava", {
		light_source = 6
	})
	minetest.override_item("lavastuff:leggings_lava", {
		light_source = 5
	})
	minetest.override_item("lavastuff:boots_lava", {
		light_source = 4
	})
	minetest.override_item("lavastuff:shield_lava", {
		light_source = 5
	})
end

if minetest.get_modpath("multitools") then
	-- Add light to lava multitool
	minetest.override_item("multitools:multitool_lava", {
		light_source = 14
	})
end
