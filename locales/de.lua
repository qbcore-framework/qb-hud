local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD Einstellungen Geladen!",
        ["hud_restart"] = "HUD wird Neugestartet!",
        ["hud_start"] = "HUD Ist nun Gestartet!",
        ["hud_command_info"] = "Dieser befehl setzt deine Jetzigen einstellungen zurück!",
        ["load_square_map"] = "Quadrats Map Lädt...",
        ["loaded_square_map"] = "Quadrats Map ist geladen!",
        ["load_circle_map"] = "Runde Map Lädt...",
        ["loaded_circle_map"] = "Runde Map ist geladen!",
        ["cinematic_on"] = "Kino Modus an!",
        ["cinematic_off"] = "Kino Modus aus!",
        ["engine_on"] = "Motor ist nun an!",
        ["engine_off"] = "Motor ist nun aus!",
        ["low_fuel"] = "Tank Status niedrig!",
        ["access_denied"] = "Du bist nicht Autorisiert!",
        ["stress_gain"] = "Du Stresst!",
        ["stress_removed"] = "Du Relaxed!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
