fx_version "cerulean"
game "gta5"

author "Earkyn"

shared_scripts {
    'Players/**/shared/*.lua',
}

client_scripts {

    -- RageUI Library
    "Library/RageUI/RMenu.lua",
    "Library/RageUI/menu/RageUI.lua",
    "Library/RageUI/menu/Menu.lua",
    "Library/RageUI/menu/MenuController.lua",
    "Library/RageUI/components/*.lua",
    "Library/RageUI/menu/**/*.lua",

    "Library/RageUIV1/RMenu.lua",
    "Library/RageUIV1/menu/RageUI.lua",
    "Library/RageUIV1/menu/Menu.lua",
    "Library/RageUIV1/menu/MenuController.lua",
    "Library/RageUIV1/components/*.lua",
    "Library/RageUIV1/menu/elements/*.lua",
    "Library/RageUIV1/menu/items/*.lua",
    "Library/RageUIV1/menu/panels/*.lua",
    "Library/RageUIV1/menu/windows/*.lua",

    "Init/cl_init.lua",
    "Utils/client/*.lua",
    "Players/**/client/*.lua",
    "Jobs/**/client/*.lua",
    "Jobs/menu.lua",
    "Modules/**/client/*.lua",
    "blips.lua",
    "markers.lua",
}


server_scripts {
    '@oxmysql/lib/MySQL.lua',

    "Init/sv_init.lua",
    "Utils/server/*.lua",
    "Players/**/server/*.lua",
    "Jobs/**/server/*.lua",
    "Modules/**/server/*.lua",
}