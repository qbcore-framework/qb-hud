local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD-innstillinger lastet!",
        ["hud_restart"] = "HUD starter på nytt!",
        ["hud_start"] = "HUD er nå startet!",
        ["hud_command_info"] = "Denne kommandoen tilbakestiller dine nåværende HUD-innstillinger!",
        ["load_square_map"] = "Firkantet kart lastes inn...",
        ["loaded_square_map"] = "Firkantet kart har lastet inn!",
        ["load_circle_map"] = "Sirkelkart lastes inn...",
        ["loaded_circle_map"] = "Sirkelkartet er lastet inn!",
        ["cinematic_on"] = "Kinematisk modus på!",
        ["cinematic_off"] = "Kinematisk modus av!",
        ["engine_on"] = "Motor startet!",
        ["engine_off"] = "Motor slått av!",
        ["low_fuel"] = "Drivstoffnivå lavt!",
        ["access_denied"] = "Du er ikke autorisert!",
        ["stress_gain"] = "Føler deg mer stresset!",
        ["stress_removed"] = "Føler deg mer avslappet!"
    }
}

if GetConvar('qb_locale', 'en') == 'no' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
