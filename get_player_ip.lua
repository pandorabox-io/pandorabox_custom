
-- workaround for issue #312
-- https://github.com/pandorabox-io/pandorabox.io/issues/312
-- result: can't ban ipv6 clients by ip anymore but no more accidental bans

local old_get_player_ip = minetest.get_player_ip

minetest.get_player_ip = function(name)
	local ip = old_get_player_ip(name)

	if not ip then
		return
	end

	if ip == "172.20.0.1" then
		-- proxied ip, ignore
		-- TODO: this is not a constant
		return
	end

	return ip
end
