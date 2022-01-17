local HUD_POSITION = { x = 0.5, y = 0.7 }
local HUD_ALIGNMENT = { x = 0, y = 0 }

local HUD_TEXT_KEY = "text"

-- playername -> data
local hud = {}

local function update_player_hud(player)
	local playername = player:get_player_name()
	local hud_data = hud[playername]
    if not hud_data then
        -- no hud configured, abort
        return
    end
    local has_protection_bypass = minetest.check_player_privs(player, "protection_bypass")

	if has_protection_bypass and not hud_data.active then
		-- enable
		hud_data.active = true
	elseif not has_protection_bypass and hud_data.active then
		-- disable
		hud_data.active = false
		player:hud_change(hud_data[HUD_TEXT_KEY], "text", "")
	end

	if has_protection_bypass then
        player:hud_change(hud_data[HUD_TEXT_KEY], "text", "WARNING: protection_bypass enabled!")
	end

end


-- state tracking

-- update
local function update_hud()
	for _, player in ipairs(minetest.get_connected_players()) do
		update_player_hud(player)
	end
	minetest.after(2, update_hud)
end
minetest.after(2, update_hud)

-- remove
minetest.register_on_leaveplayer(function(player)
	-- remove stale hud data
	local playername = player:get_player_name()
	hud[playername] = nil
end)

-- create
minetest.register_on_joinplayer(function(player)
    local is_admin = minetest.check_player_privs(player, "privs")
    if is_admin then
        -- don't warn admin(s) about protection_bypass
        return
    end

	-- create hud data
	local hud_data = {}

	local playername = player:get_player_name()
	hud[playername] = hud_data

	hud_data[HUD_TEXT_KEY] = player:hud_add({
		hud_elem_type = "text",
		position = HUD_POSITION,
		offset = {x=0, y=0},
		text = "",
		alignment = HUD_ALIGNMENT,
		scale = { x = 100, y = 100 },
		number = 0xFF0000
	})
end)
