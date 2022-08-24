local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD Einstellungen geladen!",
        ["hud_restart"] = "HUD wird neugestartet!",
        ["hud_start"] = "HUD ist nun gestartet!",
        ["hud_command_info"] = "Dieser Befehl setzt deine jetzigen Einstellungen zurück!",
        ["load_square_map"] = "Platzkarte lädt..", --  geometric shapes are probably not meant
        ["loaded_square_map"] = "Platzkarte wurde geladen!",
        ["load_circle_map"] = "Übersichtskarte lädt...",  -- geometric shapes are probably not meant
        ["loaded_circle_map"] = "Übersichtskarte wurde geladen!",
        ["cinematic_on"] = "Kino Modus aktiviert!",
        ["cinematic_off"] = "Kino Modus deaktiviert!",
        ["engine_on"] = "Motor ist nun an!",
        ["engine_off"] = "Motor ist nun aus!",
        ["low_fuel"] = "Tank Status niedrig!",
        ["access_denied"] = "Du bist nicht autorisiert!",
        ["stress_gain"] = "Stesslevel steigt!",
        ["stress_removed"] = "Du entspannst gerade!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
