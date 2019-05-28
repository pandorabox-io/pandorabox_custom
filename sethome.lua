
local old_set = sethome.set

sethome.set = function(name, pos)
	if minetest.is_protected(pos, name) then
		return false
	else
		return old_set(name, pos)
	end
end

