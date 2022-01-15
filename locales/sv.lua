local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD-inställningar laddade!",
        ["hud_restart"] = "HUD startas om!",
        ["hud_start"] = "HUD är startad!",
        ["hud_command_info"] = "Detta kommando nollställer tidigare HUD-inställningar!",
        ["load_square_map"] = "Fyrkantid överblickskarta laddas!",
        ["loaded_square_map"] = "Fyrkantig överblickskarta har laddats!",
        ["load_circle_map"] = "Cirkulär överblickskarta laddas!",
        ["loaded_circle_map"] = "Cirkulär överblickskarta har laddats!",
        ["cinematic_on"] = "Bioläge - På!",
        ["cinematic_off"] = "Bioläg - Av!",
        ["engine_on"] = "Motor startad!",
        ["engine_off"] = "Motor stängs av!",
        ["low_fuel"] = "Bränslenivå - låg!",
        ["access_denied"] = "Du har inte rätt behörighet!",
        ["stress_gain"] = "Känner dig mer stressad!",
        ["stress_removed"] = "Känner dig mer avslappnad!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
