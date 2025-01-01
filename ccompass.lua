local ccompass_is_safe_target_under = ccompass.is_safe_target_under
ccompass.is_safe_target_under = function(target, nodename)
	if 'default:stone' == nodename then
		return true
	end
	
	return ccompass_is_safe_target_under(target, nodename)
end
