unused_args = false

globals = {
	"minetest",
	"pandorabox",
	"default",
	"travelnet",
	"sethome",
	"jumpdrive",
	"minetest",
	"unified_inventory",
	"telemosaic",
	"gravity_manager",
	"spacecannon",
	"bonemeal",
	"mobs",
	"unpack",
	"farming",
	"protector"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- mod deps
	"technic_cnc", "technic",
	"loot", "mesecon", "skybox",
	"xp_redo",

	-- Minetest
	"vector", "ItemStack",
	"dump", "screwdriver",

	-- Deps
	"advtrains",
	"letters", "player_monoids",
	"pipeworks", "planetoidgen",
	"xban"
}
