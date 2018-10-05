
-- does not work with blocks (yet)
-- they are overridden in technic
-- https://github.com/minetest/minetest/blob/master/doc/lua_api.txt

local list = {
	{ name="bucket:bucket_water", xp=200 },
	{ name="bucket:bucket_river_water", xp=200 },
	{ name="bucket:bucket_lava", xp=10000 },
	{ name="technic:bucket_corium", xp=500000 },
	{ name="technic:chernobylite_block", xp=100000 },
	{ name="technic:uranium_block", xp=50000 },
	{ name="technic:uranium0_block", xp=50000 },
	{ name="technic:uranium35_block", xp=50000 }
}

for _,entry in ipairs(list) do
	print("Restricting placement of " .. entry.name .. " to xp level " .. entry.xp)


	local def = minetest.registered_nodes[entry.name]
	if not def then
		def = minetest.registered_craftitems[entry.name]
	end

	if not def then
		error("node not found: " .. entry.name)
	end

	local old_place = def.on_place

	minetest.override_item(entry.name, {
		on_place = function(itemstack, placer, pointed_thing)
			minetest.log("action", "[onplace-restriction] override for " .. entry.name)
			if placer and placer.is_player and placer:is_player() then
				local playername = placer:get_player_name()
				local xp = xp_redo.get_xp(playername)
	
				if xp < entry.xp then
					-- too low
					minetest.chat_send_player(playername, "Placement not allowed below " .. entry.xp .. " xp!")
					minetest.log("action", "[onplace-restriction] Player " .. playername .. 
						" tried to place " .. entry.name)
					return itemstack
				end
			end

			return old_place(itemstack, placer, pointed_thing)
		end
	})

end

