
-- 2018-08-22 removal of ranged weapons
minetest.register_alias("rangedweapons:shell", "default:cobble")
minetest.register_alias("rangedweapons:gold_shuriken", "default:cobble")
minetest.register_alias("rangedweapons:electrogun", "default:cobble")
minetest.register_alias("rangedweapons:handgunshot", "default:cobble")
minetest.register_alias("rangedweapons:leenfield", "default:cobble")
minetest.register_alias("rangedweapons:mese_shuriken", "default:cobble")
minetest.register_alias("rangedweapons:scout", "default:cobble")
minetest.register_alias("rangedweapons:wooden_shuriken", "default:cobble")
minetest.register_alias("rangedweapons:energycharge", "default:cobble")
minetest.register_alias("rangedweapons:boomstick", "default:cobble")
minetest.register_alias("rangedweapons:javelin", "default:cobble")
minetest.register_alias("rangedweapons:bereta", "default:cobble")
minetest.register_alias("rangedweapons:awp", "default:cobble")
minetest.register_alias("rangedweapons:sawedoff", "default:cobble")
minetest.register_alias("rangedweapons:steel_shuriken", "default:cobble")
minetest.register_alias("rangedweapons:makarov", "default:cobble")
minetest.register_alias("rangedweapons:rifleshot", "default:cobble")
minetest.register_alias("rangedweapons:diamond_shuriken", "default:cobble")
minetest.register_alias("rangedweapons:taurus", "default:cobble")
minetest.register_alias("rangedweapons:python", "default:cobble")
minetest.register_alias("rangedweapons:bronze_shuriken", "default:cobble")
minetest.register_alias("rangedweapons:revolvershot", "default:cobble")
minetest.register_alias("rangedweapons:deagle", "default:cobble")
minetest.register_alias("rangedweapons:9mm", "default:cobble")
minetest.register_alias("rangedweapons:spas12", "default:cobble")
minetest.register_alias("rangedweapons:colt45", "default:cobble")
minetest.register_alias("rangedweapons:stone_shuriken", "default:cobble")
minetest.register_alias("rangedweapons:javelint", "default:cobble")
minetest.register_alias("rangedweapons:jackhammer", "default:cobble")
minetest.register_alias("rangedweapons:mosinnagant", "default:cobble")
minetest.register_alias("rangedweapons:laser", "default:cobble")
minetest.register_alias("rangedweapons:10mm", "default:cobble")
minetest.register_alias("rangedweapons:375", "default:cobble")
minetest.register_alias("rangedweapons:lasershot", "default:cobble")



-- 2018-11-23
-- removed invisibility potion
minetest.register_alias("invisibility:potion", "default:cobble")

-- 2019-01-29
-- cotton seed oil
minetest.register_alias("technic:cottonseed_oil", "default:cobble")



-- 2018-11-30 unknown item
minetest.register_alias("chains:chandelier", "homedecor:chandelier_brass")
minetest.register_alias("basic_materialsgold_wire", "basic_materials:gold_wire")

-- 2019-06-21 digistuff upgrade
minetest.register_alias("digistuff:publicbutton", "digistuff:button")
minetest.register_alias("digistuff:publicbutton_on", "digistuff:button_on")
minetest.register_alias("digistuff:publicbutton_off", "digistuff:button_off")

-- 2019-06-26 homedecor upgrade

local replacements = {}

-- 2019-06-26 homedecor upgrade
table.insert(replacements, {"stairs:slope_shingles_terracotta", "homedecor:shingle_side_terracotta"})
table.insert(replacements, {"stairs:slope_shingles_wood", "homedecor:shingle_side_wood"})
table.insert(replacements, {"stairs:stair_shingles_wood", "default:wood"})


for i, replacement in ipairs(replacements) do
	minetest.register_lbm({
		name = "pandorabox_custom:replacement_" .. i,
		nodenames = {replacement[1]},
		run_at_every_load = true,
		action = function(pos, node)
			node.name = replacement[2]
			minetest.swap_node(pos, node)
		end
	})
end
