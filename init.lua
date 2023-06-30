
pandorabox = {}

local MP = minetest.get_modpath("pandorabox_custom")

-- anticheat stuff
dofile(MP .. "/anticheat/inv_move.lua")

-- restart if empty command
dofile(MP .. "/restart_if_empty.lua")

-- unknown item aliasing
dofile(MP.."/alias.lua")

-- warning message for default password (if set)
if minetest.settings:get("default_password") ~= "" then
	dofile(MP.."/default_password_warn.lua")
end

-- beerchat
if minetest.get_modpath("beerchat") then
	dofile(MP.."/beerchat.lua")
end

-- additional stealthnodes
if minetest.get_modpath("mesecons_stealthnode") then
	dofile(MP.."/mesecons_stealthnodes.lua")
end

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

-- travel stuff
dofile(MP.."/travel/travel.lua")
dofile(MP.."/teleport_back.lua")

if minetest.get_modpath("farming") and farming.mod == "redo" then
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

if minetest.get_modpath("technic") then
	-- grinder recipes
	dofile(MP.."/grinder.lua")

	-- extractor recipes
	dofile(MP.."/extractor.lua")
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

-- craft overrides
dofile(MP.."/crafts.lua")

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

if minetest.get_modpath("mobs") then
	dofile(MP .. "/mobs.lua")
	if minetest.get_modpath("unified_inventory") then
		dofile(MP .. "/mob_drops.lua")
	end
end

if minetest.get_modpath("mobs_animal") then
	-- additional animals/textures
	dofile(MP.."/mobs_animal.lua")

	if minetest.get_modpath("technic") then
		-- beehive enhancements (technic centrifuge)
		dofile(MP.."/mobs_bees.lua")
	end
end

-- digistuff:channelcopier fix
if minetest.get_modpath("digistuff") then
	dofile(MP .. "/digi_copier_fixer.lua")
end

-- stamina extras
if minetest.global_exists("stamina") then
	dofile(MP.."/exhaust.lua")
end

-- illumination tweaks and extras
if minetest.get_modpath("illumination") then
	dofile(MP.."/illumination.lua")
end

if minetest.get_modpath("drawers") then
	dofile(MP.."/chat/drawers_fix.lua")
end

-- extra toolranks support
if minetest.get_modpath("toolranks") then
	dofile(MP.."/toolranks.lua")
end

