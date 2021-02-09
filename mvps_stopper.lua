
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

if minetest.get_modpath("digistuff") then
	if not minetest.registered_nodes["digistuff:piston"].after_place_node then
		minetest.override_item("digistuff:piston", {
			after_place_node = mesecon.mvps_set_owner
		})
	end
end
