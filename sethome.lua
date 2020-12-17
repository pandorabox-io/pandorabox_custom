
local S = minetest.get_translator("sethome")

local function set_home(player, name, pos, set_home_func, ...)
	-- Don't allow setting home if the player is not allowed to teleport back here
	local can_teleport, errmsg = pandorabox.can_teleport(player, pos)
	if not can_teleport then
		return false, (errmsg and (errmsg .. "\n") or "") .. "Cannot set home!"
	end
	-- Don't allow setting home in a area owned by another player
	if minetest.is_protected(pos, name) then
		return false, "Cannot set home in protected area!"
	end
	if set_home_func(...) ~= false then
		return true, S("Home set!")
	end
	-- This should never be reached, but return an error message anyway
	return false, "Error setting home!"
end

-- default sethome mod
-- Override chat command so the error messages are more helpful

minetest.register_chatcommand("sethome", {
	description = S("Set your home point"),
	privs = {home = true},
	func = function(name)
		name = name or ""
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, S("Player not found!")
		end
		local pos = player:get_pos()
		return set_home(player, name, pos, sethome.set, name, pos)
	end,
})

-- unified inventory home

if minetest.get_modpath("unified_inventory") then
	local old_ui_sethome = unified_inventory.set_home

	unified_inventory.set_home = function(player, pos)
		local name = player:get_player_name()
		local set, msg = set_home(player, name, pos, old_ui_sethome, player, pos)
		if not set then
			minetest.chat_send_player(name, msg)
		end
	end
end
