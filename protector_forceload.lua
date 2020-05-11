
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
