
if minetest.registered_items["beds:bed_top"] then
    -- prevent duplication-bug in combination with replacer
    minetest.override_item("beds:bed_top", { drop = "" })
end