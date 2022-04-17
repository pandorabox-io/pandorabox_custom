
-- ip -> os.time()
local last_prejoin = {}

minetest.register_on_prejoinplayer(function(name, ip)
	minetest.log("action", "Player " .. name .. " prejoins from " .. ip)
	local now = os.time()
	if last_prejoin[ip] then
		-- there was a login attempt previously from this ip, check the delta-t
		local dt = now - last_prejoin[ip]
		if dt < 5 then
			-- limit prejoin to one attempt per 5 seconds
			minetest.log("action", "Mass-login detected from '" .. ip .. "'")
			return "Too many login-attempts, please wait a couple seconds before trying again"
		end
	end
	last_prejoin[ip] = now
end)
