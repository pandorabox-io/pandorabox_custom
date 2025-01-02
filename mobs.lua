if 20220116 > tonumber(mobs.version) then return end
-- mobs and beowulf don't play nicely together when stone is made
-- dangerous by beowulf, we counteract that here to make mobs not fear
-- stone and become more challenging again
local is_node_dangerous = mobs.is_node_dangerous
function mobs:is_node_dangerous(mob_object, nodename)
    if 'default:stone' == nodename then return false end
    return is_node_dangerous(self, mob_object, nodename)
end

