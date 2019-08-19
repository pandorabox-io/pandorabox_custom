local has_beacon_mod = minetest.get_modpath("beacon")
local use_player_monoids = minetest.global_exists("player_monoids")

local fly_near = {} -- [{ name="", distance=0 }]

local storage = minetest.get_mod_storage()
local global_fly_enabled = storage:get_int("global_fly") == 1

if has_beacon_mod then
	table.insert(fly_near, {
		name="beacon:greenbase",
		distance=20
	})
end


local player_can_fly = function(player)
	local pos = player:get_pos()
	for _, box in pairs(skybox.list) do
		if pos.y > box.miny and pos.y < box.maxy then
			-- height match found
			if box.fly then
				return true
			end
			break
		end
	end

	for _, def in pairs(fly_near) do
		if minetest.find_node_near(pos, def.distance, def.name) then
			return true
		end
	end

	return global_fly_enabled
end

local update_fly = function(player)
	local name = player:get_player_name()
	local privs = minetest.get_player_privs(name)
	local player_is_admin = privs.privs
	local player_can_always_fly = privs.player_fly
	if player_is_admin or player_can_always_fly then
		-- not touching admin privs or skybox override
		return
	end

	local can_fly = player_can_fly(player)
	if use_player_monoids then
		player_monoids.fly:add_change(player, can_fly, "pandorabox_custom:fly")
	elseif privs.fly ~= can_fly then
		privs.fly = can_fly or nil
		minetest.set_player_privs(name, privs)
	end
end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer < 2 then return end
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
	privs = {fly_event=true},
	func = function(name)
    global_fly_enabled = true
    storage:set_int("global_fly", 1)
	end
})

minetest.register_chatcommand("global_fly_disable", {
	description = "disables global fly",
	privs = {fly_event=true},
	func = function(name)
    global_fly_enabled = false
    storage:set_int("global_fly", 0)
	end
})
