local function apply_overrides()
	local additionalnodes = {
		["beacon:black"] = "channel",
		["beacon:blue"] = "channel",
		["beacon:cyan"] = "channel",
		["beacon:green"] = "channel",
		["beacon:magenta"] = "channel",
		["beacon:orange"] = "channel",
		["beacon:red"] = "channel",
		["beacon:violet"] = "channel",
		["beacon:white"] = "channel",
		["beacon:yellow"] = "channel",
                ["digibuilder:digibuilder"] = "channel",
		["digicontrol:filter"] = "channel",
		["digiline_global_memory:controller"] = "channel",
		["digiline_routing:filter"] = "channel", -- infotext is not updated
		["digilines:chest"] = "channel",
		["digilines:lcd"] = "channel",
		["digilines:lightsensor"] = "channel",
		["digilines:rtc"] = "channel",
		["digiterms:beige_keyboard"] = "channel",
		["digiterms:black_keyboard"] = "channel",
		["digiterms:cathodic_beige_monitor"] = "channel",
		["digiterms:cathodic_black_monitor"] = "channel",
		["digiterms:cathodic_white_monitor"] = "channel",
		["digiterms:lcd_monitor"] = "channel",
		["digiterms:scifi_glassscreen"] = "channel",
		["digiterms:scifi_keysmonitor"] = "channel",
		["digiterms:scifi_tallscreen"] = "channel",
		["digiterms:scifi_widescreen"] = "channel",
		["digiterms:white_keyboard"] = "channel",
		["drawers:controller"] = "digilineChannel",
		["ilights:light_off"] = "channel",
		["ilights:light_on"] = "channel",
		["jumpdrive:engine"] = "channel", -- formspec is not updated (reset button does it)
		["jumpdrive:fleet_controller"] = "channel", -- formspec is not updated (reset button does it)
		["mesecons_detector:node_detector_off"] = "digiline_channel",
		["mesecons_detector:node_detector_on"] = "digiline_channel",
		["mesecons_detector:object_detector_off"] = "digiline_channel",
		["mesecons_detector:object_detector_on"] = "digiline_channel",
		["monitoring_digilines:metric_controller"] = "channel",
		["pipeworks:autocrafter"] = "channel",
		["pipeworks:deployer_off"] = "channel",
		["pipeworks:deployer_on"] = "channel",
		["pipeworks:digiline_detector_tube_1"] = "channel",
		["pipeworks:digiline_detector_tube_2"] = "channel",
		["pipeworks:digiline_detector_tube_3"] = "channel",
		["pipeworks:digiline_detector_tube_4"] = "channel",
		["pipeworks:digiline_detector_tube_5"] = "channel",
		["pipeworks:digiline_detector_tube_6"] = "channel",
		["pipeworks:digiline_detector_tube_7"] = "channel",
		["pipeworks:digiline_detector_tube_8"] = "channel",
		["pipeworks:digiline_detector_tube_9"] = "channel",
		["pipeworks:digiline_detector_tube_10"] = "channel",
		["pipeworks:digiline_filter"] = "channel",
		["pipeworks:dispenser_off"] = "channel",
		["pipeworks:dispenser_on"] = "channel",
		["pipeworks:nodebreaker_off"] = "channel",
		["pipeworks:nodebreaker_on"] = "channel",
		["pipeworks:teleport_tube_1"] = "digiline_channel",
		["pipeworks:teleport_tube_2"] = "digiline_channel",
		["pipeworks:teleport_tube_3"] = "digiline_channel",
		["pipeworks:teleport_tube_4"] = "digiline_channel",
		["pipeworks:teleport_tube_5"] = "digiline_channel",
		["pipeworks:teleport_tube_6"] = "digiline_channel",
		["pipeworks:teleport_tube_7"] = "digiline_channel",
		["pipeworks:teleport_tube_8"] = "digiline_channel",
		["pipeworks:teleport_tube_9"] = "digiline_channel",
		["pipeworks:teleport_tube_10"] = "digiline_channel",
		["spacecannon:cannon_green"] = "channel",
		["spacecannon:cannon_red"] = "channel",
		["spacecannon:cannon_yellow"] = "channel",
		["technic:forcefield_emitter_off"] = "channel", -- formspec is not updated
		["technic:forcefield_emitter_on"] = "channel", -- formspec is not updated
		["technic:hv_battery_box0"] = "channel",
		["technic:hv_battery_box1"] = "channel",
		["technic:hv_battery_box2"] = "channel",
		["technic:hv_battery_box3"] = "channel",
		["technic:hv_battery_box4"] = "channel",
		["technic:hv_battery_box5"] = "channel",
		["technic:hv_battery_box6"] = "channel",
		["technic:hv_battery_box7"] = "channel",
		["technic:hv_battery_box8"] = "channel",
		["technic:hv_nuclear_reactor_core"] = "remote_channel",
		["technic:hv_nuclear_reactor_core_active"] = "remote_channel",
		["technic:lv_battery_box0"] = "channel",
		["technic:lv_battery_box1"] = "channel",
		["technic:lv_battery_box2"] = "channel",
		["technic:lv_battery_box3"] = "channel",
		["technic:lv_battery_box4"] = "channel",
		["technic:lv_battery_box5"] = "channel",
		["technic:lv_battery_box6"] = "channel",
		["technic:lv_battery_box7"] = "channel",
		["technic:lv_battery_box8"] = "channel",
		["technic:mithril_chest"] = "channel",
		["technic:mithril_locked_chest"] = "channel",
		["technic:mithril_protected_chest"] = "channel",
		["technic:mv_battery_box0"] = "channel",
		["technic:mv_battery_box1"] = "channel",
		["technic:mv_battery_box2"] = "channel",
		["technic:mv_battery_box3"] = "channel",
		["technic:mv_battery_box4"] = "channel",
		["technic:mv_battery_box5"] = "channel",
		["technic:mv_battery_box6"] = "channel",
		["technic:mv_battery_box7"] = "channel",
		["technic:mv_battery_box8"] = "channel",
		["technic:power_monitor"] = "channel",
		["technic:quarry"] = "channel",
		["technic:supply_converter"] = "channel",  -- formspec is not updated
		["technic:switching_station"] = "channel",
		["telemosaic:beacon"] = "channel",
		["telemosaic:beacon_disabled"] = "channel",
		["telemosaic:beacon_disabled_protected"] = "channel",
		["telemosaic:beacon_err"] = "channel",
		["telemosaic:beacon_err_protected"] = "channel",
		["telemosaic:beacon_off"] = "channel",
		["telemosaic:beacon_off_protected"] = "channel",
		["telemosaic:beacon_protected"] = "channel",
		["textline:lcd"] = "channel",
	}

	for name, field in pairs(additionalnodes) do
		if minetest.registered_nodes[name]
			and not minetest.registered_nodes[name]._digistuff_channelcopier_fieldname then
				minetest.override_item(name,{ _digistuff_channelcopier_fieldname = field })
		end
	end

	-- after channel change, some need special attention

	-- routing filter
	local osRoutingFilter = function(pos, node, player, new_channel, old_channel)
		local FILTER_INFOTEXT = "Digiline Filter (channel \"%s\")"
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", FILTER_INFOTEXT:format(meta:get_string("channel")))
	end

	-- jumpdrive engine
	local osJumpdrive = function(pos, node, player, new_channel, old_channel)
		local meta = minetest.get_meta(pos)
		jumpdrive.migrate_engine_meta(pos, meta)
		jumpdrive.update_formspec(meta, pos)
	end
	-- jumpdrive fleet controller
	local osFleetController = function(pos, node, player, new_channel, old_channel)
		local meta = minetest.get_meta(pos)
		jumpdrive.fleet.update_formspec(meta, pos)
	end

	-- force field
	local osForceField = function(pos, node, player, new_channel, old_channel)
		local nodedef = minetest.registered_nodes[node.name]
		nodedef.on_receive_fields(pos, "", { channel = new_channel }, player)
	end

	-- supply converter
	local osSupplyConverter = function(pos, node, player, new_channel, old_channel)
		local nodedef = minetest.registered_nodes[node.name]
		nodedef.on_receive_fields(pos, "", { channel = new_channel }, player)
	end

	local onsets = {
		["digiline_routing:filter"] = osRoutingFilter,
		["jumpdrive:engine"] = osJumpdrive,
		["jumpdrive:fleet_controller"] = osFleetController,
		["technic:forcefield_emitter_off"] = osForceField,
		["technic:forcefield_emitter_on"] = osForceField,
		["technic:supply_converter"] = osSupplyConverter,
	}

	for name, field in pairs(onsets) do
		if minetest.registered_nodes[name] and not minetest.registered_nodes[name]._digistuff_channelcopier_onset then
			minetest.override_item(name,{ _digistuff_channelcopier_onset = field })
		end
	end

end

apply_overrides()
