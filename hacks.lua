

-- the pathfinder is highly unreliable and grinds the server to a halt sometimes
-- see: https://github.com/minetest/minetest/issues/8584
-- lobodomizing on this end to make the mobs_* packages updateable again
minetest.find_path = function()
	return nil
end

-- https://github.com/minetest/minetest/pull/9350
-- Workaround for bug https://www.lua.org/bugs.html#5.2.3-1
-- thx HybridDog ;)
local actual_unpack = unpack
function unpack(t, a, b)
	assert(not b or b < 2^30)
	return actual_unpack(t, a, b)
end

-- unregister ip-ban command (use xban instead)
-- there are still problems with the ipv6 range comming in from a single ipv4 ip
minetest.unregister_chatcommand("ban")

-- disable digiline functionality temporarily
-- issue: https://github.com/pandorabox-io/pandorabox.io/issues/539
if minetest.get_modpath("digistuff") then
	minetest.override_item("digistuff:nic",{ digiline = { receptor = {}, effector = {} } })
end
