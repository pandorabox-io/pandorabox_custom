
local cache = {}

-- advtrains.path_get (dows not work, sideeffects)
-- advtrains.get_rail_info_at (works, no improvement)

-- advtrains.path_get_index_by_offset


local old_path_get_index_by_offset = advtrains.path_get_index_by_offset

-- memoize function
advtrains.path_get_index_by_offset = function(train, index, offset)
  local key = train.id .. "/" .. index .. "/" .. offset
  local data = cache[key]
  if data then
    return data[1], data[2], data[3]
  else
    local r1, r2, r3 = old_path_get_index_by_offset(train, index. offset)
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
