local Translations = {
    notify = {
        ["hud_settings_loaded"] = "Configuración de HUD cargada.",
        ["hud_restart"] = "HUD se está reiniciando.",
        ["hud_start"] = "HUD ya comenzó.",
        ["hud_command_info"] = "Este comando restablece la configuración del HUD",
        ["load_square_map"] = "Cargando el mapa cuadrado...",
        ["loaded_square_map"] = "El mapa cuadrado se ha cargado.",
        ["load_circle_map"] = "Cargando el mapa circulado...",
        ["loaded_circle_map"] = "El mapa circulado se ha cargado.",
        ["cinematic_on"] = "Modo de cinematográfica cargado!",
        ["cinematic_off"] = "Modo de cinematográfico desactivado.",
        ["engine_on"] = "Motor arrancado!",
        ["engine_off"] = "Motor apagado.",
        ["low_fuel"] = "Nivel de gasolian baja!",
        ["access_denied"] = "¿Que haces? No estas autorizado!",
        ["stress_gain"] = "Te estas sintiéndo mas estresado/a.",
        ["stress_removed"] = "Te estas sintiéndo mas relajado/a."
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
