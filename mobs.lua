
minetest.register_on_mods_loaded(function()
	for _, abm in ipairs(minetest.registered_abms) do

		if abm.label == "mobs_turtles:turtle spawning" then
			-- not so elegant solution for https://github.com/pandorabox-io/pandorabox.io/issues/282
			-- TODO: upstream a setting
			local old_action = abm.action
			abm.action = function(pos, node, active_object_count, active_object_count_wider)
				if pos.y < 1000 then
					-- don't spawn above y=1000
					old_action(pos, node, active_object_count, active_object_count_wider)
				end
			end
		end
	end
end)
