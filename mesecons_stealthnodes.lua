
local nodes = {
    {"default", "copperblock"},
    {"default", "goldblock"},
    {"scifi_nodes", "white"},
    {"technic", "blast_resistant_concrete"},
    {"technic", "chromium_block"},
    {"technic", "zinc_block"}
}

for _,value in pairs(nodes) do
    if minetest.get_modpath(value[1]) then
        stealthnode.register_stealthnode(value[1], value[2])
    end
end
