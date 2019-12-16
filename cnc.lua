

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

if minetest.get_modpath("moreores") then

   technic_cnc.register_all("moreores:silver_block",
      {snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2, not_in_creative_inventory=1},
      {"moreores_silver_block.png"},
      "Silver"
   )
   technic_cnc.register_all("moreores:mithril_block",
      {snappy = 1, bendy = 2, cracky = 1, melty = 2, level = 2, not_in_creative_inventory=1},
      {"moreores_mithril_block.png"},
      "Mithril"
   )

end

if minetest.get_modpath("prefab") then

   technic_cnc.register_all("prefab:concrete",
      {cracky = 2, not_in_creative_inventory=1},
      {"prefab_concrete.png"},
      "Concrete"
   )

end

if minetest.get_modpath("lavastuff") then

   technic_cnc.register_all("lavastuff:block",
      {cracky = 2, not_in_creative_inventory=1},
      {"lavastuff_block.png"},
      "Lava Block"
   )

end

-- technic

technic_cnc.register_all("technic:lead_block",
   {cracky=1, level=2, not_in_creative_inventory=1},
   {"technic_lead_block.png"},
   "Lead"
)
technic_cnc.register_all("technic:chromium_block",
   {cracky=1, level=2, not_in_creative_inventory=1},
   {"technic_chromium_block.png"},
   "Chromium"
)
technic_cnc.register_all("technic:stainless_steel_block",
   {cracky=1, level=2, not_in_creative_inventory=1},
   {"technic_stainless_steel_block.png"},
   "Stainless Steel"
)
technic_cnc.register_all("technic:carbon_steel_block",
   {cracky=1, level=2, not_in_creative_inventory=1},
   {"technic_carbon_steel_block.png"},
   "Carbon Steel"
)

-- defaults

technic_cnc.register_all("default:tinblock",
   {cracky = 1, level = 2, not_in_creative_inventory=1},
   {"default_tin_block.png"},
   "Tin"
)
technic_cnc.register_all("default:mese",
   {cracky = 1, level = 2, not_in_creative_inventory=1},
   {"default_mese_block.png"},
   "Mese"
)
technic_cnc.register_all("default:clay",
   {cracky = 1, level = 2, not_in_creative_inventory=1},
   {"default_clay.png"},
   "Clay"
)
technic_cnc.register_all("default:diamondblock",
   {cracky = 1, level = 2, not_in_creative_inventory=1},
   {"default_diamond_block.png"},
   "Diamond"
)
