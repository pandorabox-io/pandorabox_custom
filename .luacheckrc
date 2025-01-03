unused_args = false

globals = {
	"core",
	"minetest",
	"pandorabox",
	"ccompass",
	"default",
	"travelnet",
	"sethome",
	"jumpdrive",
	"unified_inventory",
	"telemosaic",
	"gravity_manager",
	"spacecannon",
	"stamina",
	"bonemeal",
	"mobs",
	"unpack",
	"farming",
	"farmingNG",
	"protector",
	-- Advtrains global functions
	"atdebug", "atwarn"
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
	"xban", "beerchat", "drawers",
	"toolranks", "stealthnode"
}
