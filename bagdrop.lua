local ui_bags_get_formspec = unified_inventory.pages.bags.get_formspec

local function onload()
    unified_inventory.pages.bags.get_formspec = function(player, perplayer_formspec)
        local formspecy = perplayer_formspec.formspec_y
        local formspec = ui_bags_get_formspec(player, perplayer_formspec).formspec
        formspec = formspec
                .. "image_button[0.25,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_up.png;uit_to_bag1;]"
                .. "tooltip[uit_to_bag1;To Bag]"
                .. "image_button[1,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_down.png;uit_from_bag1;]"
                .. "tooltip[uit_from_bag1;From Bag]"

                .. "image_button[2.25,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_up.png;uit_to_bag2;]"
                .. "tooltip[uit_to_bag2;To Bag]"
                .. "image_button[3,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_down.png;uit_from_bag2;]"
                .. "tooltip[uit_from_bag2;From Bag]"

                .. "image_button[4.25,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_up.png;uit_to_bag3;]"
                .. "tooltip[uit_to_bag3;To Bag]"
                .. "image_button[5,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_down.png;uit_from_bag3;]"
                .. "tooltip[uit_from_bag3;From Bag]"

                .. "image_button[6.25,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_up.png;uit_to_bag4;]"
                .. "tooltip[uit_to_bag4;To Bag]"
                .. "image_button[7,"
                .. (formspecy + 1.6)
                .. ";0.75,0.75;uit_down.png;uit_from_bag4;]"
                .. "tooltip[uit_from_bag4;From Bag]"
        return { formspec = formspec }
    end
end

minetest.after(0, onload)
