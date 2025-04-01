local wezterm = require 'wezterm'
return {
    keys = {
        { key = 'p', mods = 'CTRL|ALT', action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|LAUNCH_MENU_ITEMS|TABS'} },
        {
            key = 'P',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ActivateCommandPalette,
        },
    }
}