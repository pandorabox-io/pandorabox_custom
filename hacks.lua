

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

-- fix digiline nic functionality temporarily
-- issue: https://github.com/pandorabox-io/pandorabox.io/issues/539
if minetest.get_modpath("digistuff") and minetest.registered_nodes["digistuff:nic"] then
	local old_action = minetest.registered_nodes["digistuff:nic"].digiline.effector.action
	minetest.override_item("digistuff:nic",{
		digiline = {
			receptor = {},
			effector = {
				action = function(pos,node,channel,msg)
					if type(msg) ~= "string" then return end
					msg = string.gsub(msg, "%s", "%%20")
					return old_action(pos,node,channel,msg)
				end
			}
		}
	})
end

-- override signs_lib's static_save property
-- false causes it to stay loaded over the server lifetime (*all* visited signs)
-- related: https://github.com/pandorabox-io/pandorabox.io/issues/544
if minetest.get_modpath("signs_lib") then
	local def = minetest.registered_entities["signs_lib:text"]
	assert(def)
	def.static_save = true
end
