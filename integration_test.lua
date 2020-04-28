
minetest.log("warning", "[pandorabox_custom] integration-test enabled!")

-- those mods have to be present
local assert_mods = {
	"advtrains",
	"technic",
	"pipeworks",
	"moreblocks"
}

-- those nodes have to be present
local assert_nodes = {
	"jumpdrive:engine",
	"advtrains_platform:platform_high_concrete",
	"advtrains_platform:platform_high_white",
	"technic:hv_cable",
	"technic:mv_cable",
	"technic:lv_cable"
}

-- defered integration test function
minetest.register_on_mods_loaded(function()
	minetest.log("warning", "[pandorabox_custom] all mods loaded, starting delayed test-function")

	minetest.after(1, function()
		minetest.log("warning", "[pandorabox_custom] starting integration test")

		-- export stats
		local file = io.open(minetest.get_worldpath().."/registered_nodes.txt", "w" );
		if file then
			for name in pairs(minetest.registered_nodes) do
				file:write(name .. '\n')
			end
			file:close()
		end

		-- check mods
		for _, modname in ipairs(assert_mods) do
			if not minetest.get_modpath(modname) then
				error("Mod not present: " .. modname)
			end
		end

		-- check nodes
		for _, nodename in ipairs(assert_nodes) do
			if not minetest.registered_nodes[nodename] then
				error("Node not present: " .. nodename)
			end
		end

		-- write success flag
		local data = minetest.write_json({ success = true }, true);
		file = io.open(minetest.get_worldpath().."/integration_test.json", "w" );
		if file then
			file:write(data)
			file:close()
		end

		minetest.log("warning", "[pandorabox_custom] integration tests done!")
		minetest.request_shutdown("success")
	end)
end)
