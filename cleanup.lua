
-- https://github.com/pandorabox-io/pandorabox.io/issues/313
-- lets flying snow fall (from chainsaw)
minetest.register_abm({
	label = "flying snow cleanup",
	nodenames = {"default:snow"},
	neighbors = {"air"},
	interval = 5,
	chance = 20,
	action = function(pos)
		minetest.check_for_falling(pos)
	end
})

