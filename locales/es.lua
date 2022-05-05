local Translations = {
    notify = {
        ["hud_settings_loaded"] = "Configuración de HUD cargada",
        ["hud_restart"] = "¡El HUD se está reiniciando!",
        ["hud_start"] = "El HUD ha iniciado",
        ["hud_command_info"] = "Este comando reestablece la configuración del HUD",
        ["load_square_map"] = "Cargando mapa cuadrado...",
        ["loaded_square_map"] = "¡El mapa cuadrado se ha cargado!",
        ["load_circle_map"] = "Cargando mapa circular...",
        ["loaded_circle_map"] = "¡El mapa circular se ha cargado!",
        ["cinematic_on"] = "Modo cinematográfico activado",
        ["cinematic_off"] = "Modo cinematográfico desactivado",
        ["engine_on"] = "Motor encendido",
        ["engine_off"] = "Motor apagado",
        ["low_fuel"] = "¡Nivel de gasolina bajo!",
        ["access_denied"] = "¡No estás autorizado!",
        ["stress_gain"] = "¡Te estás estresando!",
        ["stress_removed"] = "Te estás relajando"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
