
spacecannon.can_shoot = function(pos)
	-- only allow shooting in space
	return pos.y > 1000
end
