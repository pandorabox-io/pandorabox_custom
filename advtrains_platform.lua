
if minetest.get_modpath("prefab") then
  advtrains.register_platform(":advtrains_platform", "prefab:concrete")
end


if minetest.get_modpath("scifi_nodes") then
  advtrains.register_platform(":advtrains_platform", "scifi_nodes:white")
  advtrains.register_platform(":advtrains_platform", "scifi_nodes:white2")
  advtrains.register_platform(":advtrains_platform", "scifi_nodes:tile")
  advtrains.register_platform(":advtrains_platform", "scifi_nodes:whitetile")
  advtrains.register_platform(":advtrains_platform", "scifi_nodes:lighttop")
  advtrains.register_platform(":advtrains_platform", "scifi_nodes:wall")
end
