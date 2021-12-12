
-- Battleaxe

if minetest.get_modpath("castle_weapons") then
	local desc = minetest.registered_tools["castle_weapons:battleaxe"].description
	minetest.override_item("castle_weapons:battleaxe", {
		description = toolranks.create_description(desc, 0, 1),
		original_description = desc,
		after_use = toolranks.new_afteruse
	})
end


-- Vine shears

if minetest.get_modpath("vines") then
	local desc = minetest.registered_tools["vines:shears"].description
	minetest.override_item("vines:shears", {
        description = toolranks.create_description(desc, 0, 1),
		original_description = desc,
		after_use = toolranks.new_afteruse
    })
end
