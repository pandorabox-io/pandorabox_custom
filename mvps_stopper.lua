
if minetest.get_modpath("technic") then
	-- 2019-02-25 fix protector remove vector with piston and constructor
	mesecon.register_mvps_stopper("technic:constructor_mk1_off")
	mesecon.register_mvps_stopper("technic:constructor_mk1_on")
	mesecon.register_mvps_stopper("technic:constructor_mk2_off")
	mesecon.register_mvps_stopper("technic:constructor_mk2_on")
	mesecon.register_mvps_stopper("technic:constructor_mk3_off")
	mesecon.register_mvps_stopper("technic:constructor_mk3_on")
end
