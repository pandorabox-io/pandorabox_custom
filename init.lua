
pandorabox = {}

local MP = minetest.get_modpath("pandorabox_custom")

dofile(MP.."/alias.lua")

if minetest.get_modpath("bucket") and minetest.get_modpath("xp_redo") then
	dofile(MP.."/onplace_restriction.lua")
end

if minetest.get_modpath("loot") then
	dofile(MP.."/loot.lua")
end

dofile(MP.."/privs.lua")
dofile(MP.."/death.lua")
dofile(MP.."/travel.lua")

if minetest.get_modpath("skybox") then
	dofile(MP.."/skybox.lua")
	dofile(MP.."/fly.lua")
end

dofile(MP.."/stats.lua")
dofile(MP.."/join.lua")
dofile(MP.."/crafts.lua")
dofile(MP.."/ylimit.lua")

if minetest.get_modpath("technic") then
	dofile(MP.."/grinder.lua")
end

if minetest.get_modpath("technic_cnc") then
	dofile(MP.."/cnc.lua")
end

if minetest.get_modpath("mesecons_mvps") then
	dofile(MP.."/mvps_stopper.lua")
end

dofile(MP.."/userlimit.lua")
dofile(MP.."/sethome.lua")

if minetest.get_modpath("letters") then
	dofile(MP.."/letters.lua")
end

if minetest.get_modpath("jumpdrive") then
	dofile(MP.."/jumppoints.lua")
end

--dofile(MP.."/drawers.lua")
