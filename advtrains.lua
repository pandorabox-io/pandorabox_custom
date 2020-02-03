
local cache = {}


local old_path_get = advtrains.path_get

-- memoize path_get function
advtrains.path_get = function(train, index)
  local key = train.id .. "/" .. index
  local result1, result2
  local data = cache[key]
  if not data then
    -- not cached
    result1, result2 = old_path_get(train, index)
    cache[key] = { result1, result2 }
  else
    -- cached
    result1 = data[1]
    result2 = data[2]
  end

  return result1, result2
end

local old_mainloop_trainlogic = advtrains.mainloop_trainlogic
advtrains.mainloop_trainlogic = function(...)
  old_mainloop_trainlogic(...)
  -- flush cache every step
  cache = {}
end
