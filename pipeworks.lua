
minetest.register_chatcommand("pipeworks_flush", {
        description = "flushes the pipeworks tubes",
        privs = {server=true},
        func = function(name)
                minetest.log("warning", "Player " .. name .. " flushes the pipeworks tubes")
                local count = 0
                for id, entity in pairs(pipeworks.luaentity.entities) do
                        entity:remove()
                        count = count + 1
                end
                minetest.log("warning", "Flushed: " .. count .. " items")
                return true, "Flushed: " .. count .. " items"
        end
})

minetest.register_chatcommand("pipeworks_stats", {
        description = "Returns some pipeworks stats",
        privs = {interact=true},
        func = function(name)
                local count = 0
                for id, entity in pairs(pipeworks.luaentity.entities) do
                        count = count + 1
                end
                return true, "Items in tubes: " .. count
        end
})

-- add "Done" button
-- idea and implementation originally by @SwissalpS
-- (https://github.com/pandorabox-io/pipeworks/commit/fe699d96213332c8dd5b9b7fd6fb0ec37eb3e500)
for i=1,10 do
  minetest.override_item("pipeworks:teleport_tube_" .. i, {
    on_construct = function(pos)
      local meta = minetest.get_meta(pos)
      meta:set_int("dist", 0)
      meta:set_string("formspec", "size[2.9.1,0.8]"..
        "image[0,0;1,1;pipeworks_mese_sand_tube_inv.png]"..
        "field[1.3,0.4;1,1;dist;radius;${dist}]"..
        "button_exit[2,0.1;1,1;buttDone;Done]" ..
      default.gui_bg..
      default.gui_bg_img)
      meta:set_string("infotext", "Adjustable Vacuuming Pneumatic Tube Segment")
    end
  })
end
