local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUDの設定を読み込みました!",
        ["hud_restart"] = "HUDを再起動しました!",
        ["hud_start"] = "HUDは起動しています!",
        ["hud_command_info"] = "このコマンドはHUDの設定を再読込します。",
        ["load_square_map"] = "四角形のマップをロード中",
        ["loaded_square_map"] = "四角形のマップをロードしました!",
        ["load_circle_map"] = "円形マップをロード中",
        ["loaded_circle_map"] = "円形マップをロードしました!",
        ["cinematic_on"] = "シネマモードをオンにしました!",
        ["cinematic_off"] = "シネマモードをオフにしました!",
        ["engine_on"] = "エンジン起動!",
        ["engine_off"] = "エンジンを切りました!",
        ["low_fuel"] = "ガソリンの残量が減っています!",
        ["access_denied"] = "あなたには権限がありません!",
        ["stress_gain"] = "かなりストレスを感じているようです!",
        ["stress_removed"] = "リラックスできているようです!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
