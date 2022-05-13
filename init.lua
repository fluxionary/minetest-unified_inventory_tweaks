ui_trashcan = {}
ui_trashcan.last_trashed_by_player = {}

ui_trashcan.modname = minetest.get_current_modname()
ui_trashcan.modpath = minetest.get_modpath(ui_trashcan.modname)

function ui_trashcan.log(level, message, ...)
    message = message:format(...)
    minetest.log(level, ("[%s] %s"):format(ui_trashcan.modname, message))
end

dofile(ui_trashcan.modpath .. "/bagdrop.lua")
dofile(ui_trashcan.modpath .. "/clear_grid.lua")
dofile(ui_trashcan.modpath .. "/trashcan.lua")
