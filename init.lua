unified_inventory.register_button("trashcan", {
    type="image",
    image="ui_trash_icon.png",
    tooltip = "Trashcan"
})

unified_inventory.register_page("trashcan", {
    get_formspec = function(player, perplayer_formspec)
        local formspecy = perplayer_formspec.formspec_y
        local formspec = "background[0,"..(formspecy + 3.5)..";8,4;ui_main_inventory.png]"
                      .. "background[3.56,2;0.92,0.92;ui_bags_trash.png]"
                      .. "label[3.5,1.5;Trash:]"
                      .. "list[detached:trash;main;3.5,2.1;1,1;]"
                      .. "listring[current_player;main]"
                      .. "listring[detached:trash;main]"
        return {
            formspec = formspec,

        }
    end
})


