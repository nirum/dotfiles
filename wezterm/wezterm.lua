-- Load config object.
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- Colors and fonts.
config.font = wezterm.font("DankMono Nerd Font")
config.color_scheme = "Tokyo Night"
config.font_size = 16

-- Window.
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Tab bar.
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- Background image.
config.background = {
  {
    source = {
      File = "/Users/niru/dotfiles/images/gradient.png",
    },
    hsb = {
      hue = 1.0,
      saturation = 1.02,
      brightness = 0.25,
    },
  },
}

-- tmux-like behavior
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    mods = "LEADER",
    key = "c",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    mods = "LEADER",
    key = "x",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    mods = "LEADER",
    key = "n",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    mods = "LEADER",
    key = "p",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    mods = "LEADER",
    key = "-",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "\\",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "j",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    mods = "LEADER",
    key = "k",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    mods = "LEADER",
    key = "h",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    mods = "LEADER",
    key = "l",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
  {
    mods = "LEADER",
    key = "H",
    action = wezterm.action.AdjustPaneSize({ "Left", 10 }),
  },
  {
    mods = "LEADER",
    key = "L",
    action = wezterm.action.AdjustPaneSize({ "Right", 10 }),
  },
  {
    mods = "LEADER",
    key = "J",
    action = wezterm.action.AdjustPaneSize({ "Down", 10 }),
  },
  {
    mods = "LEADER",
    key = "K",
    action = wezterm.action.AdjustPaneSize({ "Up", 10 }),
  },
}

-- status-pane
wezterm.on("update-right-status", function(window, _)
  local ACTIVE_BG = "#1a1b27"
  local INACTIVE_BG = "#16161f"
  local FG = "#faf0f0"

  local prefix = "   "
  if window:leader_is_active() then
    prefix = " " .. utf8.char(0xf013) .. " " -- gear
  end

  local BG = ACTIVE_BG
  if window:active_tab():tab_id() ~= 0 then
    BG = INACTIVE_BG
  end -- arrow color based on if tab is first pane

  window:set_left_status(wezterm.format({
    { Foreground = { Color = FG } },
    { Background = { Color = BG } },
    { Text = prefix },
  }))
end)

return config
