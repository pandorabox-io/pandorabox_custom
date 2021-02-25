
spacecannon.can_shoot = function(pos)
	-- only allow shooting in space or deep underground
	return (pos.y > 1000) or (pos.y < -1000)
end
