
pandorabox = {}

local MP = minetest.get_modpath("pandorabox_custom")

-- unknown item aliasing
dofile(MP.."/alias.lua")

-- xban issue
dofile(MP.."/get_player_ip.lua")

-- cleanups
dofile(MP.."/cleanup.lua")

-- bucket and xp limitation
if minetest.get_modpath("bucket") and minetest.get_modpath("xp_redo") then
	dofile(MP.."/onplace_restriction.lua")
	dofile(MP.."/xp_priv.lua")
end

-- loot customization
if minetest.get_modpath("loot") then
	dofile(MP.."/loot.lua")
end

-- death fix stuff (stolen from https://github.com/BlockySurvival/bls_custom/blob/master/fix_dead_on_login.lua)
dofile(MP.."/fix_dead_on_login.lua")

-- /spawn command
dofile(MP.."/spawn.lua")

-- /dump_pos command
dofile(MP.."/dump_pos.lua")

-- custom privs
dofile(MP.."/privs.lua")

-- death message
dofile(MP.."/death.lua")

-- travel stuff
dofile(MP.."/travel/travel.lua")
dofile(MP.."/teleport_back.lua")

if minetest.get_modpath("farming") then
	-- farming customizations
	dofile(MP.."/farming.lua")
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
end

if minetest.get_modpath("telemosaic") then
	-- limit telemosaic travel
	dofile(MP.."/travel/telemosaic.lua")
end

if minetest.get_modpath("travelnet") then
	-- limit travelnet
	dofile(MP.."/travel/travelnet.lua")
end

if minetest.get_modpath("gravity_manager") then
	-- register gravity zones
	dofile(MP.."/gravity_manager.lua")
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

-- no_announce priv
dofile(MP.."/join_announce.lua")

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

-- announce chat cmd's
dofile(MP.."/announce.lua")

-- recipe redefinitions
dofile(MP.."/recipes.lua")

-- general hacks
dofile(MP.."/hacks.lua")

-- spawn fast walk
if minetest.get_modpath("player_monoids") then
	dofile(MP.."/spawn_fast_walk.lua")
end

if minetest.settings:get_bool("enable_integration_test") then
	dofile(MP.."/integration_test.lua")
end

if minetest.get_modpath("scifi_nodes") then
	dofile(MP.."/scifi_override.lua")
end
