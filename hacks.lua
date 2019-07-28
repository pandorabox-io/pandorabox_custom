

-- the pathfinder is highly unreliable and grinds the server to a halt sometimes
-- see: https://github.com/minetest/minetest/issues/8584
-- lobodomizing on this end to make the mobs_* packages updateable again
minetest.find_path = function()
	return nil
end
