
local nodes = {
    {"scifi_nodes", "white"},
    {"technic", "zinc_block"},
    {"technic", "chromium_block"}
}

for _,value in pairs(nodes) do
    if minetest.get_modpath(value[1]) then
        stealthnode.register_stealthnode(value[1], value[2])
    end
end