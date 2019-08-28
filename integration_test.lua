
minetest.register_on_mods_loaded(function()
	minetest.after(1, function()
		local data = minetest.write_json({ success = true }, true);
		local path = minetest.get_worldpath().."/integration_test.json";

		local file = io.open( path, "w" );
		if( file ) then
			file:write(data);
			file:close();
		end

		minetest.request_shutdown("success")
	end)
end)
