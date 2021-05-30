
minetest.register_privilege("softlimit_bypass", {
	description = "can bypass the max player limit"
})

minetest.register_can_bypass_userlimit(function(name, ip)
	return minetest.check_player_privs(name, {softlimit_bypass=true}) orminetest.check_player_privs(name, {staff=true})
end)
