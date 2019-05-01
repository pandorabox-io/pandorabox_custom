
-- 2018-08-23 y limit (reserved space)
local timer = 0
minetest.register_globalstep(function(dtime)
   timer = timer + dtime

   -- every 2 seconds
   if timer < 2 then return end
   timer = 0

   for _,player in ipairs(minetest.get_connected_players()) do

   local pos = player:getpos()

   if pos.y > 18000 then
      player:setpos({x=pos.x, y=17950, z=pos.z})
      minetest.chat_send_player(player:get_player_name(), "The area above 18k is reserved for future use, sorry...")
   end

   end
end)
