


-- remove player data if the xp-value is around 0 (auth, meta and inventory)
minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	local xp = xp_redo.get_xp(playername)
	if xp < 10 then
		minetest.after(1.0, function()
			minetest.remove_player(playername)
			minetest.remove_player_auth(playername)
		end)
	end
end)
