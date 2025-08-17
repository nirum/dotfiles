local wezterm = require("wezterm")
local config = wezterm.config_builder()
config["automatically_reload_config"] = true
config["window_close_confirmation"] = "NeverPrompt"
config["font"] = wezterm.font("DankMono Nerd Font")
config["colors"] = {foreground = "#C5C9C7", background = "#090E13", cursor_bg = "#C5C9C7", cursor_fg = "#090E13", cursor_border = "#090E13", selection_fg = "#C5C9C7", selection_bg = "#24262D", scrollbar_thumb = "#24262D", split = "#24262D", tab_bar = {background = "#020303", active_tab = {bg_color = "#D7AF5F", fg_color = "#1C1C1C", intensity = "Bold"}, inactive_tab = {bg_color = "#1C1C1C", fg_color = "#807D78"}, inactive_tab_hover = {bg_color = "#4E4E4E", fg_color = "#909090"}, new_tab = {bg_color = "#1C1C1C", fg_color = "#807D78"}, new_tab_hover = {bg_color = "#4E4E4E", fg_color = "#909090", italic = true}}, ansi = {"#090E13", "#C4746E", "#8A9A7B", "#C4B28A", "#8BA4B0", "#A292A3", "#8EA4A2", "#A4A7A4"}, brights = {"#A4A7A4", "#E46876", "#87A987", "#E6C384", "#7FB4CA", "#938AA9", "#7AA89F", "#C5C9C7"}}
config["font_size"] = 16
config["window_decorations"] = "RESIZE"
config["window_padding"] = {left = 10, right = 10, top = 10, bottom = 10}
config["window_frame"] = {font = wezterm.font({family = "Helvetica Neue", weight = "Bold"}), font_size = 14}
config["hide_tab_bar_if_only_one_tab"] = true
config["tab_bar_at_bottom"] = true
config["use_fancy_tab_bar"] = false
config["tab_and_split_indices_are_zero_based"] = false
config["background"] = {{source = {File = "/Users/niru/dotfiles/images/gradient.png"}, hsb = {hue = 1, saturation = 1.02, brightness = 0.25}}}
return config
