
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
if minetest.get_modpath("basic_materials") then
	minetest.register_alias("basic_materialsgold_wire", "basic_materials:gold_wire")
end

-- 2019-06-21 digistuff upgrade
minetest.register_alias("digistuff:publicbutton", "digistuff:button")
minetest.register_alias("digistuff:publicbutton_on", "digistuff:button_on")
minetest.register_alias("digistuff:publicbutton_off", "digistuff:button_off")

-- 2019-06-26 homedecor upgrade
minetest.register_alias("stairs:slope_shingles_terracotta", "homedecor:shingle_side_terracotta")
minetest.register_alias("stairs:slope_shingles_wood", "homedecor:shingle_side_wood")
minetest.register_alias("stairs:stair_shingles_wood", "default:wood")
minetest.register_alias("stairs:stair_shingles_asphalt", "default:wood")


-- 2019-08-16 smartrenting removal (again, the 2nd time)
minetest.register_alias("smartrenting:panel", "default:stone")
minetest.register_alias("smartrenting:card", "default:stone")

-- 2019-08-16 bushes removal
minetest.register_alias("bushes:youngtree2_bottom", "air")
minetest.register_alias("bushes:bushbranches1", "air")
minetest.register_alias("bushes:bushbranches2", "air")
minetest.register_alias("bushes:bushbranches3", "air")
minetest.register_alias("bushes:bushbranches4", "air")
minetest.register_alias("bushes:BushLeaves1", "air")
minetest.register_alias("bushes:BushLeaves2", "air")

-- 2019-12 prefab fork with moreblocks conflict
minetest.register_alias_force("prefab:concrete_stair", "prefab:stair_concrete")
minetest.register_alias_force("prefab:concrete_slab", "prefab:slab_concrete")

-- 2020-04-02 radioactive gas removal
minetest.register_alias("radioactive_gas:gas", "vacuum:vacuum")

-- 2020-05-26 digiline_routing removal
minetest.register_alias("digiline_routing:diode", "default:cobble")
minetest.register_alias("digiline_routing:filter", "default:cobble")
minetest.register_alias("digiline_routing:filter_b", "default:cobble")
minetest.register_alias("digiline_routing:splitter", "default:cobble")
minetest.register_alias("digiline_routing:splitter_b", "default:cobble")

-- for future use
local replacements = {}
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
