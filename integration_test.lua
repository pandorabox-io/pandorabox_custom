
minetest.log("warning", "[pandorabox_custom] integration-test enabled!")

minetest.register_on_mods_loaded(function()
	minetest.log("warning", "[pandorabox_custom] all mods loaded, starting delayed test-function")

	minetest.after(1, function()
		minetest.log("warning", "[pandorabox_custom] starting integration test")

		local data = minetest.write_json({ success = true }, true);
		local path = minetest.get_worldpath().."/integration_test.json";

		local file = io.open( path, "w" );
		if( file ) then
			file:write(data);
			file:close();
		end

		minetest.log("warning", "[pandorabox_custom] integration tests done!")
		minetest.request_shutdown("success")
	end)
end)
