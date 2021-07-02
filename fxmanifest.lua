fx_version 'cerulean'
game 'gta5'

description 'QB-HUD'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

server_script 'server/money.lua'

client_scripts {
	'client/money.lua',
	'client/main.lua',
	'client/ui.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/main.css',
	'html/css/pricedown_bl-webfont.ttf',
	'html/css/pricedown_bl-webfont.woff',
	'html/css/pricedown_bl-webfont.woff2',
	'html/css/gta-ui.ttf',
	'html/js/app.js',
	'html/css/pdown.ttf'
}