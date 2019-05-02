local has_beacon_mod = minetest.get_modpath("beacon")

local fly_near = {} -- [{ name="", distance=0 }]

local storage = minetest.get_mod_storage()
local global_fly_enabled = storage:get_int("global_fly") == 1

if has_beacon_mod then
	table.insert(fly_near, {
		name="beacon:greenbase",
		distance=20
	})
end


local update_fly = function(player)
  local pos = player:get_pos()
  local name = player:get_player_name()
  local privs = minetest.get_player_privs(name)

  local player_is_admin = privs.privs
  local player_can_always_fly = privs.skybox_fly

  local skybox_enables_fly = false
  for _,box in pairs(skybox.list) do
    if pos.y > box.miny and pos.y < box.maxy then
      -- height match found
      if box.fly then
        skybox_enables_fly = true
      end
    end
  end

  local is_near_fly_node = false
  for _, def in pairs(fly_near) do
    if minetest.find_node_near(pos, def.distance, {def.name}) then
      is_near_fly_node = true
      break
    end
  end


	if player_is_admin or player_can_always_fly then
		-- not touching admin privs or skybox override
		return
	end

  local can_fly = skybox_enables_fly or is_near_fly_node or global_fly_enabled

	if privs.fly and can_fly then
		-- already fly granted
		return
	end

	if not privs.fly and not can_fly then
		-- no fly
		return
	end

	if not privs.fly and can_fly then
		-- grant fly
		privs.fly = true
		minetest.set_player_privs(name, privs)

	elseif privs.fly and not can_fly then
		-- revoke fly
		privs.fly = nil
		minetest.set_player_privs(name, privs)

	end

end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer < 0.5 then return end
	timer=0
	local t0 = minetest.get_us_time()
	local players = minetest.get_connected_players()
	for i, player in pairs(players) do
		update_fly(player)
	end
	local t1 = minetest.get_us_time()
	local delta_us = t1 -t0
	if delta_us > 150000 then
		minetest.log("warning", "[fly] update took " .. delta_us .. " us")
	end
end)

minetest.register_chatcommand("global_fly_enable", {
	description = "enables global fly",
	privs = {skybox_fly_event=true},
	func = function(name)
    global_fly_enabled = true
    storage:set_int("global_fly", 1)
	end
})

minetest.register_chatcommand("global_fly_disable", {
	description = "disables global fly",
	privs = {skybox_fly_event=true},
	func = function(name)
    global_fly_enabled = false
    storage:set_int("global_fly", 0)
	end
})
