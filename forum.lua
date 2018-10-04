
local http = pandorabox.http
if not http then
	error("http api not available")
end


local forum_user_url = minetest.settings:get("pandorabox.forum.adduser.url")
local forum_secret = minetest.settings:get("pandorabox.forum.secret")

if not forum_user_url then
	error("no setting found: pandorabox.forum.adduser.url")
end

if not forum_secret then
	error("no setting found: pandorabox.forum.secret")
end

minetest.register_chatcommand("forumregister", {
	params="<password>",
	description="register in pandorabox forum with initial <password>",
	func = function(name, param)

		if not param or param == "" then
			minetest.chat_send_player(name, "no password given!")
			return true
		end

		local data = {
			username=name,
			password=param,
			secret=forum_secret
		}

	        http.fetch({
	                url=forum_user_url,
	                extra_headers = { "Content-Type: application/json" },
	                post_data=minetest.write_json(data),
	                timeout=5
	        }, function(res)
	                if res.succeeded and res.code == 200 then
				minetest.log("action", "player registered in forum: " .. name)
	                        minetest.chat_send_player(name, "Successfully registered in forum with username: " ..
					name .. " and password: " ..
					param)
			else
				minetest.log("error", "forum register failed: " .. res.code .. " with player " .. name)
				minetest.chat_send_player(name, "Could not register in forum: " ..
				"please contact the admin via in-game /mail or admin@pandorabox.io")
	                end
	        end)

		return true
	end
})


