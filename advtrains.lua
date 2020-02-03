
local cache = {}


local old_path_get = advtrains.path_get

-- memoize path_get function
advtrains.path_get = function(train, index)
  local key = train.id .. "/" .. index
  local result = cache[key]
  if not result then
    result = old_path_get(train, index)
    cache[key] = result
  end

  return result
end


minetest.register_globalstep(function(dtime)
  -- flush cache every step
  cache = {}
end)
