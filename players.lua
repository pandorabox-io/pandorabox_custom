
minetest.register_privilege("server_softfull_join", {
	description = "Can join the server if soft-limit is reached",
	give_to_singleplayer= false,
})

minetest.register_on_prejoinplayer(function(name, ip)

	--local privs = minetest.get_player_privs(name)
	--return minetest.serialize(privs)
	--TODO: reject new players if server full
end)
