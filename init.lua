
pandorabox = {}

local MP = minetest.get_modpath("pandorabox_custom")

-- unknown item aliasing
dofile(MP.."/alias.lua")

-- bucket and xp limitation
if minetest.get_modpath("bucket") and minetest.get_modpath("xp_redo") then
	dofile(MP.."/onplace_restriction.lua")
end

-- loot customization
if minetest.get_modpath("loot") then
	dofile(MP.."/loot.lua")
end

-- custom privs
dofile(MP.."/privs.lua")

-- death message
dofile(MP.."/death.lua")

-- travel stuff
dofile(MP.."/travel/travel.lua")
dofile(MP.."/teleport_back.lua")

if minetest.get_modpath("jumpdrive") then
	-- limit jumpdrive travel
	dofile(MP.."/travel/jumpdrive.lua")

	-- jumppoints (different energy requirements)
	dofile(MP.."/jumppoints.lua")
end

if minetest.get_modpath("telemosaic") then
	-- limit telemosaic travel
	dofile(MP.."/travel/telemosaic.lua")
end

if minetest.get_modpath("travelnet") then
	-- limit travelnet
	dofile(MP.."/travel/travelnet.lua")
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
	dofile(MP.."/grinder.lua")
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


