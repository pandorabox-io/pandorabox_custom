
-- https://github.com/pandorabox-io/pandorabox.io/issues/298
minetest.override_item("farming:melon_8", {
  buildable_to = false
})

-- Dough craftitem
minetest.register_craftitem(":farming:dough", {
  description = "Dough",
  inventory_image = "farming_dough.png",
})

-- swap farming/default blueberry names
-- See: https://github.com/pandorabox-io/pandorabox-mods/pull/997

--[[
Comment by @OgelGames:
> default:blueberries should be wild, because they grow on bushes,
> and farming:blueberries should not be wild because they grow as a small plant
--]]

minetest.override_item("default:blueberries", {
  description = farming.intllib("Blueberries")
})

minetest.override_item("farming:blueberries", {
  description = default.get_translator("Blueberries")
})

-- undo change to rhubarb light values
-- see https://github.com/pandorabox-io/pandorabox-mods/pull/1235

if farming.registered_plants["farming:rhubarb"] then
	for i=1,3 do
		minetest.override_item("farming:rhubarb_"..i, {
			minlight = 13,
			maxlight = 15,
		})
	end
	farming.registered_plants["farming:rhubarb"].minlight = 13
	farming.registered_plants["farming:rhubarb"].maxlight = 15
end
