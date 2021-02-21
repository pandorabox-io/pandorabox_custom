
local list = {
	{ name="bucket:bucket_water", xp=200 },
	{ name="bucket:bucket_river_water", xp=200 },
	{ name="bucket:bucket_lava", xp=10000 }
}

if minetest.get_modpath("technic") then
	table.insert(list, { name="technic:water_can", xp=200 })
	table.insert(list, { name="technic:river_water_can", xp=200 })
	table.insert(list, { name="technic:lava_can", xp=10000 })
	table.insert(list, { name="technic:bucket_corium", xp=500000 })
	table.insert(list, { name="technic:chernobylite_block", xp=100000 })
	table.insert(list, { name="technic:uranium_block", xp=50000 })
	table.insert(list, { name="technic:uranium0_block", xp=50000 })
	table.insert(list, { name="technic:uranium35_block", xp=50000 })
end

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

				if pointed_thing.type == "node" and pointed_thing.under then
					minetest.log("action", "[onplace] player " .. playername .. " places " ..
					entry.name .. " at " .. minetest.pos_to_string(pointed_thing.under))
				end

				if minetest.check_player_privs(playername, { bypass_onplace_restriction=true }) then
					return old_place(itemstack, placer, pointed_thing)
				end

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
