-- clear out default protector denials
replacer.deny_list['priv_protector:protector'] = nil
replacer.deny_list['protector:protect'] = nil
replacer.deny_list['protector:protect2'] = nil
replacer.deny_list['xp_redo:protector'] = nil
replacer.deny_list['xp_redo:xpgate'] = nil

-- and add them to limits
replacer.register_limit('priv_protector:protector', 1)
replacer.register_limit('protector:protect', 1)
replacer.register_limit('protector:protect2', 1)
replacer.register_limit('xp_redo:protector', 1)
replacer.register_limit('xp_redo:xpgate', 1)

