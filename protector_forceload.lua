
-- Related issue:
-- https://github.com/pandorabox-io/pandorabox.io/issues/503

-- loads a position from cache to ensure that the mapblock there is loaded
local function load_from_cache(pos)
  minetest.get_voxel_manip(pos, pos)
end

local old_can_dig = protector.can_dig
protector.can_dig = function(radius, pos, digger, onlyowner, infolevel)

  local distance = radius * 2

  -- load mapblocks in a cross pattern
  load_from_cache(vector.add(pos, {x=-distance, y=0, z=0}))
  load_from_cache(vector.add(pos, {x=0, y=-distance, z=0}))
  load_from_cache(vector.add(pos, {x=0, y=0, z=-distance}))
  load_from_cache(vector.add(pos, {x=distance, y=0, z=0}))
  load_from_cache(vector.add(pos, {x=0, y=distance, z=0}))
  load_from_cache(vector.add(pos, {x=0, y=0, z=distance}))

  return old_can_dig(radius, pos, digger, onlyowner, infolevel)
end


-- additionally do periodic forceloads from cache
-- near players
-- https://github.com/minetest/minetest/issues/9849
-- https://gitlab.com/h2mm/mapload_boost/-/blob/master/init.lua

local reload_period = 1
local time_left = reload_period + 10
local load_radius = 16

minetest.register_globalstep(function(dtime)
	time_left = time_left - dtime
	if time_left < 0 then
		time_left = reload_period
		for _, player in ipairs(minetest.get_connected_players()) do
			minetest.get_voxel_manip(
        vector.subtract(player:get_pos(), load_radius),
        vector.subtract(player:get_pos(), load_radius)
      )
		end
	end
end)
