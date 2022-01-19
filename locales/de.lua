local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD Einstellungen geladen!",
        ["hud_restart"] = "HUD startet neu!",
        ["hud_start"] = "HUD Ist nun gestartet!",
        ["hud_command_info"] = "Dieser Command setzt deine HUD Einstellungen zurück!",
        ["load_square_map"] = "Quadrats Map Lädt...",
        ["loaded_square_map"] = "Quadrats Map ist geladen!",
        ["load_circle_map"] = "Kreis map lädt...",
        ["loaded_circle_map"] = "Kreis Map ist geladen!",
        ["cinematic_on"] = "Kino Modus an!",
        ["cinematic_off"] = "Kino Modus aus!",
        ["engine_on"] = "Motor ist nun an!",
        ["engine_off"] = "Motor ist nun aus!",
        ["low_fuel"] = "Tank level niederig!",
        ["access_denied"] = "Du bist nicht autorisiert!",
        ["stress_gain"] = "Du fühlst dich gestresst!",
        ["stress_removed"] = "Du fühlst dich relaxed!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
