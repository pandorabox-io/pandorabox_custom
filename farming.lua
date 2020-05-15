
-- https://github.com/pandorabox-io/pandorabox.io/issues/298
minetest.override_item("farming:melon_8", {
  buildable_to = false
})

-- Dough craftitem
minetest.register_craftitem(":farming:dough", {
  description = "Dough",
  inventory_image = "farming_dough.png",
})
