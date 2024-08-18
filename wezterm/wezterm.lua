local wezterm = require "wezterm"
local config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  color_scheme = 'Tokyo Night',
  font = wezterm.font("DankMono Nerd Font", { weight = "Bold" }),
  window_decorations = "RESIZE",
  font_size = 16,
  background = {
    {
      source = {
        File = "/Users/niru/dotfiles/images/gradient.png",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
    }
  },
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  }
}

return config
