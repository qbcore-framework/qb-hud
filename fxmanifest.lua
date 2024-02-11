fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Heads-up display letting players track their hunger, thirst, stress, and more'
version '2.2.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
    'html/*',
    'html/index.html',
    'html/styles.css',
    'html/responsive.css',
    'html/app.js',
}
