ui_trashcan = {}
ui_trashcan.last_trashed_by_player = {}

local trash_inv = minetest.create_detached_inventory("ui_trashcan", {
    on_put = function(inv, listname, index, stack, player)
        inv:set_stack(listname, index, nil)
        local player_name = player:get_player_name()
        minetest.sound_play("trash", {to_player=player_name, gain = 1.0})
        ui_trashcan.last_trashed_by_player[player_name] = stack:to_string()
    end,
})
trash_inv:set_size("main", 1)

unified_inventory.register_button("trashcan", {
    type = "image",
    image = "ui_bags_trash.png",
    tooltip = "Trashcan"
})

unified_inventory.register_page("trashcan", {
    get_formspec = function(player, perplayer_formspec)
        local formspecy = perplayer_formspec.formspec_y
        local formspec = "background[0,"..(formspecy + 3.5)..";8,4;ui_main_inventory.png]"
                      .. "button[3.5,"..(formspecy + 2) .. ";1,1;ui_trashcan_undo;Undo]"
                      .. "label[3.5,"..(formspecy + 0.5)..";Trash:]"
                      .. "background[3.56,"..(formspecy + 1)..";0.92,0.92;ui_bags_trash.png]"
                      .. "list[detached:ui_trashcan;main;3.5,"..(formspecy + 1.1)..";1,1;]"
                      .. "listring[current_player;main]"
                      .. "listring[detached:ui_trashcan;main]"
        return {formspec = formspec}
    end
})

function ui_trashcan.undo(player)
    local player_name = player:get_player_name()
    local itemstring = ui_trashcan.last_trashed_by_player[player_name]
    if itemstring then
        local itemstack  = ItemStack(itemstring)
        local player_inv = player:get_inventory()
        if player_inv:room_for_item("main", itemstack) then
            player_inv:add_item("main", itemstack)
            ui_trashcan.last_trashed_by_player[player_name] = nil
        else
            minetest.chat_send_player(player_name, "No room in inventory to undo trash.")
        end
    else
        minetest.chat_send_player(player_name, "Nothing to undo.")
    end
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if fields["ui_trashcan_undo"] then
        ui_trashcan.undo(player)
    end
end)
