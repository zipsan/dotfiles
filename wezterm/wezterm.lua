local wezterm = require 'wezterm'

local LEFT_ARROW = utf8.char(0xff0b3)
local SOLID_LEFT_ARROW = utf8.char(0xff0b2)
local SOLID_RIGHT_ARROW = utf8.char(0xff0b0)
local scrollback_lines = 200000;

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'OneHalfDark'

-- 背景透過
config.window_background_opacity = 0.9

-- フォントの設定
config.font = wezterm.font_with_fallback({
    { family = "Anonymous Pro" },
    { family = "BIZ UDゴシック"},
    { family = "Blobmoji" },
})
config.adjust_window_size_when_changing_font_size = false

-- フォントサイズの設定
config.font_size = 11

-- IME有効化
config.use_ime = true

-- Window
config.inactive_pane_hsb = {
  brightness = 0.5,
  hue = 1.0,
  saturation = 0.8
}

-- Shortcut Keys
---- Leader Key (Ctrl + x)
config.leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  -- Leader + | で新しいペインを作成(画面を分割)
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  -- Leader + - で新しいペインを作成(画面を分割)
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain =  'CurrentPaneDomain' }
  },
  -- Leader + q で新しいペインを閉じる
  {
    key = 'q',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  -- Leader + c で新しいTabを作成
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  -- Ctrl + wでTabを閉じる
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  -- Leader + n でTabを移動
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'b',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  -- Leader + hjkl でPaneを移動
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
}

return config
