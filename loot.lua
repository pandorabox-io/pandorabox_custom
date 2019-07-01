
loot.register_loot(
	{ weights = { valuable = 50 },
	  payload = { stack = ItemStack("mobs:lava_orb"),
		      min_size = 1,
		      max_size = 2,
       },
})

loot.register_loot(
        { weights = { valuable = 20, generic = 20 },
          payload = { stack = ItemStack("default:diamondblock"),
                      min_size = 1,
                      max_size = 3,
       },
})

if minetest.get_modpath("currency") then

	loot.register_loot(
	        { weights = { generic = 200 },
	          payload = { stack = ItemStack("currency:minegeld_5"),
	                      min_size = 1,
	                      max_size = 10,
	       },
	})

	loot.register_loot(
	        { weights = { generic = 100 },
	          payload = { stack = ItemStack("currency:minegeld_10"),
	                      min_size = 1,
	                      max_size = 10,
	       },
	})
end


loot.register_loot(
        { weights = { generic = 200 },
          payload = { stack = ItemStack("ethereal:strawberry"),
                      min_size = 5,
                      max_size = 50,
       },
})

loot.register_loot(
        { weights = { generic = 200 },
          payload = { stack = ItemStack("ethereal:orange"),
                      min_size = 5,
                      max_size = 50,
       },
})


