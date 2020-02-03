
local cache = {}


local old_get_rail_info_at = advtrains.get_rail_info_at

-- memoize function
advtrains.get_rail_info_at = function(pos, drives_on)
  local key = pos.x .. "/" .. pos.y .. "/" .. pos.z .. "/"
  if drives_on then
    key = key + "true"
  else
    key = key + "false"
  end

  local data = cache[key]
  if data then
    return data[1], data[2], data[3]
  else
    local r1, r2, r3 = old_get_rail_info_at(pos, drives_on)
    cache[key] = { r1, r2, r3 }
    return r1, r2, r3
  end
end

local old_mainloop_trainlogic = advtrains.mainloop_trainlogic
advtrains.mainloop_trainlogic = function(...)
  old_mainloop_trainlogic(...)
  -- flush cache every step
  cache = {}
end
