local MP = minetest.get_modpath("pandorabox_custom")

dofile(MP.."/alias.lua")
dofile(MP.."/onplace_restriction.lua")
dofile(MP.."/loot.lua")
dofile(MP.."/privs.lua")
dofile(MP.."/death.lua")
dofile(MP.."/travelnet.lua")
dofile(MP.."/skybox.lua")
dofile(MP.."/fly.lua")
dofile(MP.."/stats.lua")
dofile(MP.."/join.lua")
dofile(MP.."/crafts.lua")
dofile(MP.."/ylimit.lua")
dofile(MP.."/grinder.lua")
dofile(MP.."/cnc.lua")

if minetest.get_modpath("mesecons_mvps") then
	dofile(MP.."/mvps_stopper.lua")
end

dofile(MP.."/userlimit.lua")
dofile(MP.."/sethome.lua")
dofile(MP.."/letters.lua")
dofile(MP.."/jumppoints.lua")
--dofile(MP.."/drawers.lua")
