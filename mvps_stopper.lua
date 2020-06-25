
if minetest.get_modpath("technic") then
	-- 2019-02-25 fix protector remove vector with piston and constructor
	mesecon.register_mvps_stopper("technic:constructor_mk1_off")
	mesecon.register_mvps_stopper("technic:constructor_mk1_on")
	mesecon.register_mvps_stopper("technic:constructor_mk2_off")
	mesecon.register_mvps_stopper("technic:constructor_mk2_on")
	mesecon.register_mvps_stopper("technic:constructor_mk3_off")
	mesecon.register_mvps_stopper("technic:constructor_mk3_on")
end

mesecon.register_mvps_stopper("default:chest_open")
mesecon.register_mvps_stopper("default:chest_locked_open")
mesecon.register_mvps_stopper("default:chest_locked")

if minetest.get_modpath("computer") then
	mesecon.register_mvps_stopper("computer:tetris_arcade")
end

if minetest.get_modpath("fancy_vend") then
	mesecon.register_mvps_stopper("fancy_vend:display_node")
	mesecon.register_mvps_stopper("fancy_vend:player_vendor")
	mesecon.register_mvps_stopper("fancy_vend:player_depo")
	mesecon.register_mvps_stopper("fancy_vend:admin_vendor")
	mesecon.register_mvps_stopper("fancy_vend:admin_depo")
end

if minetest.get_modpath("drawers") then
	-- mitigate potential drawers duplication hack
	-- TODO: upstream fix
	mesecon.register_mvps_stopper("drawers:acacia_wood1")
	mesecon.register_mvps_stopper("drawers:acacia_wood2")
	mesecon.register_mvps_stopper("drawers:acacia_wood4")
	mesecon.register_mvps_stopper("drawers:aspen_wood1")
	mesecon.register_mvps_stopper("drawers:aspen_wood2")
	mesecon.register_mvps_stopper("drawers:aspen_wood4")
	mesecon.register_mvps_stopper("drawers:junglewood1")
	mesecon.register_mvps_stopper("drawers:junglewood2")
	mesecon.register_mvps_stopper("drawers:junglewood4")
	mesecon.register_mvps_stopper("drawers:pine_wood1")
	mesecon.register_mvps_stopper("drawers:pine_wood2")
	mesecon.register_mvps_stopper("drawers:pine_wood4")
	mesecon.register_mvps_stopper("drawers:wood1")
	mesecon.register_mvps_stopper("drawers:wood2")
	mesecon.register_mvps_stopper("drawers:wood4")
	mesecon.register_mvps_stopper("drawers:controller") -- just in case
end
