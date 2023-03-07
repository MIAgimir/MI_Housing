fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@ox_core/imports/server.lua',
    'server/main.lua',
}

client_scripts {
    '@ox_core/imports/client.lua',
    'client/int_logic.lua',
    'client/int_shells.lua'
}


-- https://github.com/levdevlev/lev-apartments
data_file 'DLC_ITYP_REQUEST' 'lev_apart_shell.ytyp'