
--[[
[{
	"pos": {
		"x": 100,
		"y": 200,
		"z": 300
	},
	"name": "",
	"push": false,
	"pull": true,
	"radius": 120
}]
--]]

local jumppoints = {}

local old_calculate_power = jumpdrive.calculate_power
jumpdrive.calculate_power = function(radius, distance, sourcePos, targetPos)
	for _, jumppoint in ipairs(jumppoints) do
		-- check pull distance
		local pos_distance = vector.distance(targetPos, jumppoint.pos)
		if jumppoint.push then
			-- check push distance
			pos_distance = vector.distance(sourcePos, jumppoint.pos)
		end

		if pos_distance < jumppoint.radius then
			return 0
		end
	end

	return old_calculate_power(radius, distance, sourcePos, targetPos)
end


local load_data = function()
  local path = minetest.get_worldpath().."/jumppoints.json";

  local file = io.open( path, "r" );
  if( file ) then
    local data = file:read("*all");
    local jp = minetest.parse_json(data);
    file:close();

    if jp then
      jumppoints = jp

      local count = 0
      for _, jumppoint in ipairs(jumppoints) do
        print("[pandorabox_custom] jumppoints '" .. jumppoint.name .. "', pos: " ..
		minetest.pos_to_string(jumppoint.pos) .. ", radius: " .. jumppoint.radius)
        count = count + 1
      end

      print("[pandorabox_custom] Loaded " .. count .. " jumppoints")
    else
      return false
    end
  else
    print("[pandorabox_custom] Error: Savefile '" .. path .. "' not found.")
  end

  return true
end

load_data()


minetest.register_chatcommand("jumppoints_reload", {
  description = "reload jumppoints.json",
  privs = { server = true },
  func = function(name, param)
    if load_data() then
      return true, "reload successful"
    else
      return true, "error, could not load jumppoints.json"
    end
  end
})
