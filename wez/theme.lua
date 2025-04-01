local wezterm = require 'wezterm'
local colors = require 'colors'
local config = {}

local fontName = 'MesloLGM Nerd Font'

config.window_frame = {

    font = wezterm.font { family = fontName, weight = 'Bold' },
    font_size = 10.0,

    active_titlebar_bg = colors.titlebar_bg.active,
    inactive_titlebar_bg = colors.titlebar_bg.inactive,
}

config.colors = {
    tab_bar = {
        active_tab = {
            bg_color = colors.tab.bg.active,
            fg_color = colors.tab.fg.active,
        },
        inactive_tab = {
            bg_color = colors.tab.bg.inactive,
            fg_color = colors.tab.fg.inactive,
        },
        inactive_tab_hover = {
            bg_color = colors.tab.bg.hover,
            fg_color = colors.tab.fg.hover,
            italic = true,
        },
        new_tab = {
            bg_color = colors.new_tab.bg.normal,
            fg_color = colors.new_tab.fg.normal,
        },
        new_tab_hover = {
            bg_color = colors.new_tab.bg.hover,
            fg_color = colors.new_tab.fg.hover,
        },
    }
}

config.command_palette_bg_color = colors.command_palette.bg
config.command_palette_fg_color = colors.command_palette.fg
config.command_palette_font_size = 10
config.command_palette_rows = 14

config.color_scheme = 'catppuccin-mocha'
config.font = wezterm.font(fontName)
config.font_size = 10


return config