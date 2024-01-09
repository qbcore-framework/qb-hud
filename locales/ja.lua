local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD設定を読み込みました",
        ["hud_restart"] = "HUDを再起動しています",
        ["hud_start"] = "HUDを起動しました",
        ["hud_command_info"] = "このコマンドは現在のHUD設定をリセットします",
        ["load_square_map"] = "スクエアマップ読み込み中...",
        ["loaded_square_map"] = "スクエアマップ読み込み完了",
        ["load_circle_map"] = "サークルマップ読み込み中...",
        ["loaded_circle_map"] = "サークルマップ読み込み完了",
        ["cinematic_on"] = "シネマティックモードを有効にしました",
        ["cinematic_off"] = "シネマティックモードを無効にしました",
        ["engine_on"] = "エンジン始動",
        ["engine_off"] = "エンジン停止",
        ["low_fuel"] = "燃料が残りわずかです！",
        ["access_denied"] = "権限がありません！",
        ["stress_gain"] = "ストレスを感じた！",
        ["stress_removed"] = "リラックスした気分"
    }
}

if GetConvar('qb_locale', 'en') == 'ja' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
