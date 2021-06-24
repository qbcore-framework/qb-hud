fx_version 'cerulean'
game 'gta5'

description 'QB-HUD'
version '1.0.0'

server_scripts {
	"config.lua",
	"server/money.lua",
}

client_scripts {
	"config.lua",
	"client/money.lua",
	"client/main.lua",
	"client/ui.lua",
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
	'html/css/pdown.ttf',
}