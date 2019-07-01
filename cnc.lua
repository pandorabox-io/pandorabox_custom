

-- 2018-10-31
-- cnc nodes
-- https://github.com/pandorabox-io/pandorabox.io/issues/20

if minetest.get_modpath("scifi_nodes") then

	technic_cnc.register_all("scifi_nodes:white2",
		{cracky=1, not_in_creative_inventory=1},
		{"scifi_nodes_white2.png"},
		"White wall"
	)

	technic_cnc.register_all("scifi_nodes:black",
	        {cracky=1, not_in_creative_inventory=1},
	        {"scifi_nodes_black.png"},
	        "Black wall"
	)
end
