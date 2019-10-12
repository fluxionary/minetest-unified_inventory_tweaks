local ui_craft_get_formspec = unified_inventory.pages.craft.get_formspec

local function onload()
    unified_inventory.pages.craft = {
        get_formspec = function(player, perplayer_formspec)
            local formspecy = perplayer_formspec.formspec_y
            local formspec = ui_craft_get_formspec(player, perplayer_formspec).formspec
            formspec = formspec
                  .. "image_button[1.25,"
                  .. (formspecy + 1)
                  .. ";0.75,0.75;ui_reset_icon.png;clear_grid;]"
                  .. "tooltip[clear_grid;Clear Grid]"
            return { formspec = formspec }
        end,
    }
end

onload()

local function clear_grid(player)
    local player_inv = player:get_inventory()
    if not player_inv then return end
    for i = 1,9 do
        local grid_stack = player_inv:get_stack("craft", i)
        if player_inv:room_for_item("main") then
            player_inv:set_stack("craft", i, nil)
            local remainder = player_inv:add_item("main", grid_stack)
            if not remainder:is_empty() then
                ui_trashcan.log("error", "lost items on clearing grid: %s", remainder:to_string())
            end
        end
    end
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if fields.clear_grid then
        clear_grid(player)
    end
end)
