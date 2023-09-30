fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'RexShack#3041'
description 'rsg-weaponsmith'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    '@rsg-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

client_script {
    'client/client.lua',
    'client/client_shop.lua',
    'client/dataview.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'server/server_shop.lua'
}

dependencies {
    'rsg-core',
    'ox_lib',
}

lua54 'yes'