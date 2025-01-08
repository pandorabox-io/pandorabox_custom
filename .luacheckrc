unused_args = false

globals = {
	"core",
	"minetest",

	-- Advtrains global functions
	"atdebug", "atwarn",
	"beerchat",
	"bonemeal",
	"ccompass",
	"default",
	"farming",
	"farmingNG",
	"gravity_manager",
	"jumpdrive",
	"mobs",
	"pandorabox",
	"protector",
	"sethome",
	"spacecannon",
	"stamina",
	"telemosaic",
	"travelnet",
	"unified_inventory",
	"unpack",
}

read_globals = {
	-- Stdlib
	string = { fields = { "split" } },
	table = { fields = { "copy", "getn" } },

	-- Luanti / Minetest
	"dump",
	"ItemStack",
	"vector",

	-- mod deps
	"advtrains",
	"drawers",
	"letters",
	"loot",
	"mesecon",
	"pipeworks",
	"planetoidgen",
	"player_monoids",
	"screwdriver",
	"skybox",
	"stealthnode",
	"technic",
	"technic_cnc",
	"toolranks",
	"xban",
	"xp_redo",
}

