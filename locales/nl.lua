local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD instellingen geladen!",
        ["hud_restart"] = "HUD is aan het herstarten!",
        ["hud_start"] = "HUD is herstart!",
        ["hud_command_info"] = "Deze command reset jouw huidige HUD instellingen!",
        ["load_square_map"] = "Vierkante map is aan het laden...",
        ["loaded_square_map"] = "Vierkante map is geladen!",
        ["load_circle_map"] = "Cirkel map is aan het laden...",
        ["loaded_circle_map"] = "Cirkel map is geladen!",
        ["cinematic_on"] = "Cinema modus aan!",
        ["cinematic_off"] = "Cinema modus uit!",
        ["engine_on"] = "Motor is gestart!",
        ["engine_off"] = "Motor is gestopt!",
        ["low_fuel"] = "Laag brandstofniveau!",
        ["access_denied"] = "Je bent niet gemachtigd!",
        ["stress_gain"] = "Gestresseerd zijn!",
        ["stress_removed"] = "Relaxed zijn!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
