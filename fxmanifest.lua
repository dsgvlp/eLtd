fx_version "cerulean"
game "gta5"
author "Funnyguy le plus beau le plus frais"

shared_scripts {
    'shared/shared.lua',
}

client_scripts {
    -- RageUI Library
    "Library/RageUI/RMenu.lua",
    "Library/RageUI/menu/RageUI.lua",
    "Library/RageUI/menu/Menu.lua",
    "Library/RageUI/menu/MenuController.lua",
    "Library/RageUI/components/*.lua",
    "Library/RageUI/menu/**/*.lua",
    -- Client
    "Init/cl_init.lua",
    "client/*.lua",
}


server_scripts {
    -- Redirection OxMysql/MySQL-Async
    '@oxmysql/lib/MySQL.lua',
    -- Server
    "Init/sv_init.lua",
    "client/*.lua",
}
