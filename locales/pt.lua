local Translations = {
    notify = {
        ["hud_settings_loaded"] = "Definições Da HUD Carregadas!",
        ["hud_restart"] = "A HUD Está A Reiniciar!",
        ["hud_start"] = "A HUD Está Agora Iniciada!",
        ["hud_command_info"] = "Este comando reseta as definições da tua HUD!",
        ["load_square_map"] = "A Carregar Mapa Quadrado!",
        ["loaded_square_map"] = "Mapa Quadrado Carregado!",
        ["load_circle_map"] = "A Carregar Mapa Redondo!",
        ["loaded_circle_map"] = "Mapa Redondo Carregado!",
        ["cinematic_on"] = "Modo Cinematic Ativado!",
        ["cinematic_off"] = "Modo Cinematic Desativado!",
        ["engine_on"] = "Motor Ligado!",
        ["engine_off"] = "Motor Desligado!",
        ["low_fuel"] = "Nível Do Óleo Em Baixo!",
        ["access_denied"] = "Não Estás Autorizado!",
        ["stress_gain"] = "A Sentir-me Mais Stressado(a)!",
        ["stress_removed"] = "A Sentir-me Mais Calmo(a)!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
