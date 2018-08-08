

-- 2018-06-20 removed smartrent mod
minetest.register_alias("smartrenting:panel", "air")

-- 2018-06-20 update hunger mod and removed sprint mod
-- fast priv retroactive
minetest.register_on_joinplayer(function(player)

	-- Not needed for stamina mod
	--if not minetest.check_player_privs(player, { fast=true }) then
	--	local privs = minetest.get_player_privs(player:get_player_name())
	--	privs.fast = true
	--	minetest.set_player_privs(player:get_player_name(), privs)
	--end


	-- 2018-08-07 home priv
	if not minetest.check_player_privs(player, { home=true }) then
		local privs = minetest.get_player_privs(player:get_player_name())
		privs.home = true
		minetest.set_player_privs(player:get_player_name(), privs)
	end

end)

-- 2018-08-08 cookable stairs
minetest.register_craft({
	type = "cooking",
	output = "moreblocks:stair_stone",
	recipe = "moreblocks:stair_cobble",
})
