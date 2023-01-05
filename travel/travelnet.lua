
-- public networks
--
-- they are attachable and removable if not protected
local public_networks = {}

-- semi public networks
--
-- only moderators ("ban" priv) can attach/remove them
local semi_public_networks = {}

-- TODO: externalize to file
public_networks["korlen"] = true
semi_public_networks["shared"] = true
semi_public_networks["admin"] = true

-- who can dig the box
travelnet.allow_dig = function(player_name, owner_name, network_name, pos)

	if not pos then
		-- no position available, skip additional checks
		return false
	end

	if minetest.is_protected(pos, player_name) then
		-- protected travelnet, no removal possible (even with "ban" privs)
		return false
	end

	local is_moderator = minetest.check_player_privs(player_name, { ban=true })
	if is_moderator then
		-- allow moderators to remove travelnets
		return true
	end

	if public_networks[owner_name] then
		-- allow removal of public travelnet boxes if they aren't protected or under your protection
		return true
	end

end

-- who can attach to which network
travelnet.allow_attach = function(player_name, owner_name, network_name)

	if public_networks[owner_name] then
		-- public networks are always attachable
		return true
	end

	local is_moderator = minetest.check_player_privs(player_name, { ban=true })
	local is_staff = minetest.check_player_privs(player_name, { staff=true })
	if (is_moderator or is_staff) and semi_public_networks[owner_name] then
		-- travelnet attachable with players that have "ban" or "staff" privs
		return true
	end

	return false
end

-- basic travelling stuff
travelnet.allow_travel = function( player_name, owner_name, network_name, station_name_start, station_name_target )

	local has_override_priv = minetest.check_player_privs(player_name, { protection_bypass=true })
	if has_override_priv then
		-- admin can go everywhere...
		return true
	end

	-- extracted target pos
	local target_pos

	-- travelnets of the owner
	local travelnets = travelnet.get_travelnets(owner_name)

	-- sanity check
	if travelnets and travelnets[network_name] and travelnets[network_name][station_name_target] then
		target_pos = travelnets[network_name][station_name_target].pos
	else
		-- error!
		return false
	end

	-- protected target with "(P) name"
	if station_name_target and string.sub(station_name_target, 1, 3) == "(P)" then
		if travelnets and travelnets[network_name] and
			travelnets[network_name][station_name_target] then

			minetest.load_area(target_pos)
			if minetest.is_protected(target_pos, player_name) then
				minetest.chat_send_player(player_name, "This station is protected!")
				return false
			end
		end
	end

	-- check if player can teleport there
	local player = minetest.get_player_by_name(player_name)
	local can_teleport, err_msg = pandorabox.can_teleport(player, target_pos)

	if err_msg then
		minetest.chat_send_player(player_name, err_msg)
	end

	return can_teleport
end
