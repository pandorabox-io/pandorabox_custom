
pandorabox = {}

local MP = minetest.get_modpath("pandorabox_custom")

-- anticheat stuff
dofile(MP .. "/anticheat/inv_move.lua")

-- unknown item aliasing
dofile(MP.."/alias.lua")

-- warning message for default password (if set)
if minetest.settings:get("default_password") then
	dofile(MP.."/default_password_warn.lua")
end

-- xban issue
dofile(MP.."/get_player_ip.lua")

-- cleanups
dofile(MP.."/cleanup.lua")

-- prejoin log
dofile(MP.."/prejoin.lua")

-- bucket and xp limitation
if minetest.get_modpath("bucket") and minetest.get_modpath("xp_redo") then
	dofile(MP.."/onplace_restriction.lua")
	dofile(MP.."/xp_priv.lua")
end

-- advtrains_platform nodes
if minetest.get_modpath("advtrains_platform") then
	dofile(MP.."/advtrains_platform.lua")
end

-- player cleanup
-- NOTE: temporarily disabled, might be the cause of https://github.com/pandorabox-io/pandorabox.io/issues/471
--[[
if minetest.get_modpath("xp_redo") then
	dofile(MP.."/player_cleanup.lua")
end
--]]

-- loot customization
if minetest.get_modpath("loot") then
	dofile(MP.."/loot.lua")
end

-- death fix stuff (stolen from https://github.com/BlockySurvival/bls_custom/blob/master/fix_dead_on_login.lua)
dofile(MP.."/fix_dead_on_login.lua")

-- /spawn command
dofile(MP.."/chat/spawn.lua")

-- various privileges
dofile(MP.."/privs/common.lua")
dofile(MP.."/privs/protection.lua")
dofile(MP.."/privs/fly.lua")
dofile(MP.."/privs/layers.lua")

-- death message
dofile(MP.."/death.lua")

-- travel stuff
dofile(MP.."/travel/travel.lua")
dofile(MP.."/teleport_back.lua")

if minetest.get_modpath("protector") then
	-- protector customizations
	dofile(MP.."/protector_forceload.lua")
end

if minetest.get_modpath("farming") and farming.mod == "redo" then
	-- farming customizations
	dofile(MP.."/farming.lua")
end

if minetest.get_modpath("bamboo") then
	-- bamboo/plant stuff
	dofile(MP.."/plant_overrides.lua")
end

if minetest.get_modpath("jumpdrive") then
	-- limit jumpdrive travel
	dofile(MP.."/travel/jumpdrive.lua")

	-- jumppoints (different energy requirements)
	dofile(MP.."/jumppoints.lua")
end

if minetest.get_modpath("pipeworks") then
	-- pipeworks commands
	dofile(MP.."/pipeworks.lua")

	if pipeworks.tptube then
		dofile(MP.."/tp_tube_fixer.lua")
	end
end

if minetest.get_modpath("telemosaic") then
	-- limit telemosaic travel
	dofile(MP.."/travel/telemosaic.lua")
end

if minetest.get_modpath("travelnet") then
	-- limit travelnet
	dofile(MP.."/travel/travelnet.lua")
	-- server control room teleport command (/control)
	dofile(MP.."/chat/control.lua")
end

if minetest.get_modpath("gravity_manager") then
	-- register gravity zones
	dofile(MP.."/gravity_manager.lua")
end

if minetest.get_modpath("planetoidgen") then
	-- register planets
	dofile(MP.."/planets.lua")
end

if minetest.get_modpath("skybox") then
	-- planetary skyboxes
	dofile(MP.."/skybox.lua")

	-- fly check
	dofile(MP.."/fly.lua")
end

-- item/nodes stats
dofile(MP.."/stats.lua")

-- join priv set/revoke
dofile(MP.."/join.lua")

-- craft overrides
dofile(MP.."/crafts.lua")

if minetest.get_modpath("technic") then
	-- grinder recipes
	dofile(MP.."/grinder.lua")

	-- extractor recipes
	dofile(MP.."/extractor.lua")

	-- tweaks
	dofile(MP.."/technic.lua")
end

if minetest.get_modpath("technic_cnc") then
	dofile(MP.."/cnc.lua")
end

if minetest.get_modpath("mesecons_mvps") then
	dofile(MP.."/mvps_stopper.lua")
end

-- join-limit bypass
dofile(MP.."/userlimit.lua")

-- protected sethome
dofile(MP.."/sethome.lua")

-- letters mod
if minetest.get_modpath("letters") then
	dofile(MP.."/letters.lua")
end

-- spacecannon mod
if minetest.get_modpath("spacecannon") then
	dofile(MP.."/spacecannon.lua")
end

-- recipe redefinitions
dofile(MP.."/recipes.lua")

-- general hacks
dofile(MP.."/hacks.lua")

-- spawn fast walk
if minetest.get_modpath("player_monoids") then
	dofile(MP.."/spawn_fast_walk.lua")
end

-- maptools custmization
if minetest.get_modpath("maptools") then
	dofile(MP.."/maptools.lua")
end

-- custom powered stand from scifi_nodes
if minetest.get_modpath("scifi_nodes") then
	dofile(MP.."/scifi_override.lua")
end

if minetest.get_modpath("bonemeal") then
	dofile(MP.."/bonemeal.lua")
end

if minetest.settings:get_bool("enable_integration_test") then
	dofile(MP.."/integration_test.lua")
end

if minetest.settings:get_bool("enable_recipe_test") then
	dofile(MP.."/recipe_test.lua")
end

if minetest.get_modpath("technic") and minetest.get_modpath("mobs_animal") then
	dofile(MP.."/mobs_bees.lua")
end
