local MP = minetest.get_modpath("pandorabox_custom")
pandorabox = {
}

dofile(MP.."/onplace_restriction.lua")
dofile(MP.."/loot.lua")


-- 2018-06-20 removed smartrent mod
minetest.register_alias("smartrenting:panel", "air")

-- 2018-06-20 update hunger mod and removed sprint mod
-- fast priv retroactive
minetest.register_on_joinplayer(function(player)

	-- Not needed for stamina mod
	--if not minetest.check_player_privs(player, { fast=true }) then
	--	local privs = minetest.get_player_privs(player:get_player_name())
	--	privs.fast = true
	--	minetest.set_player_privs(player:get_player_name(), privs)
	--end


	-- 2018-08-07 home priv
	if not minetest.check_player_privs(player, { home=true }) then
		local privs = minetest.get_player_privs(player:get_player_name())
		privs.home = true
		minetest.set_player_privs(player:get_player_name(), privs)
	end

	-- 2018-11-12
	-- register last connected ip
	local ip = minetest.get_player_ip(player:get_player_name())
	player:set_attribute("last_ip", ip);

end)

-- 2018-08-08 cookable stairs
minetest.register_craft({
	type = "cooking",
	output = "moreblocks:stair_stone",
	recipe = "moreblocks:stair_cobble",
})

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


-- 2018-08-23 y limit (reserved space)
local timer = 0
minetest.register_globalstep(function(dtime)
   timer = timer + dtime
   
   -- every 2 seconds
   if timer < 2 then return end
   timer = 0
   
   for _,player in ipairs(minetest.get_connected_players()) do

   local pos = player:getpos()

   if pos.y > 18000 then
      player:setpos({x=pos.x, y=17950, z=pos.z})
      minetest.chat_send_player(player:get_player_name(), "The area above 18k is reserved for future use, sorry...")
   end

   end
end)


-- 2018-09-07 dye fix
-- https://github.com/h-v-smacker/technic/blob/a5cfbfdb4989786aacdb24002c9c2bbeb97d028b/technic/machines/register/recipe_defusing.lua

local dyes = {
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}

for i = 1, #dyes do
	local name, desc, craft_color_group = unpack(dyes[i])
	minetest.register_craft{
		type = "shapeless",
		output = "wool:" .. name,
		recipe = {"group:dye," .. craft_color_group, "group:wool"},
	}
end


-- 2018-09-07
-- bronze block to ingots
minetest.register_craft({
	type = "shapeless",
	output = 'default:bronze_ingot 9',
	recipe = {
		'default:bronzeblock'
	}
})

-- 2018-09-18
-- cotton seed to flour

technic.register_grinder_recipe({
	input={"farming:seed_cotton"},
	output="farming:flour 1"
})

-- 2018-10-31
-- cnc nodes
-- https://github.com/pandorabox-io/pandorabox.io/issues/20

technic.cnc.register_all("scifi_nodes:white2",
	{cracky=1, not_in_creative_inventory=1},
	{"scifi_nodes_white2.png"},
	"White wall"
)

technic.cnc.register_all("scifi_nodes:black",
        {cracky=1, not_in_creative_inventory=1},
        {"scifi_nodes_black.png"},
        "Black wall"
)

-- 2018-11-23
-- removed invisibility potion
minetest.register_alias("invisibility:potion", "default:cobble")




