local Translations = {
    notify = {
        ["hud_settings_loaded"] = "Configurações do HUD carregadas!",
        ["hud_restart"] = "O HUD está sendo reiniciado!",
        ["hud_start"] = "O HUD foi iniciado!",
        ["hud_command_info"] = "Este comando redefine suas configurações atuais do HUD!",
        ["load_square_map"] = "Carregando o mapa quadrado...",
        ["loaded_square_map"] = "O mapa quadrado foi carregado!",
        ["load_circle_map"] = "Carregando o mapa circular...",
        ["loaded_circle_map"] = "O mapa circular foi carregado!",
        ["cinematic_on"] = "Modo Cinemático ativado!",
        ["cinematic_off"] = "Modo Cinemático desativado!",
        ["engine_on"] = "Motor Ligado!",
        ["engine_off"] = "Motor Desligado!",
        ["low_fuel"] = "Nível de Combustível Baixo!",
        ["access_denied"] = "Você não está autorizado!",
        ["stress_gain"] = "Sentindo mais estresse!",
        ["stress_removed"] = "Sentindo-se mais relaxado!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
