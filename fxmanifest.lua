fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'

client_scripts {
    '@ox_core/imports/client.lua',
    'client/housing_main.lua',
    'client/shells_main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@ox_core/imports/server.lua',
    'server/main.lua',
}

files {
    'lev_apart_shell.ytyp'
}

-- Shells & their creators --
-- https://github.com/levdevlev/lev-apartments
data_file 'DLC_ITYP_REQUEST' 'lev_apart_shell.ytyp'