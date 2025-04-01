-- The only required line is this one.
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
-- Some empty tables for later use
local config = {}
local mouse_bindings = {}
local launch_menu = {}

wezterm.on('gui-attached', function(domain)
  -- maximize all displayed windows on startup
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)


if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    local is_windows = true
end


local helpers = require("helpers")


local theme = require("theme")
local keybinds = require("keybinds")

helpers.mergeTables(config,theme)
helpers.mergeTables(config,keybinds)


config.default_prog = { 'pwsh' }

table.insert(launch_menu, {
  label = 'PowerShell 7',
  args = { 'pwsh' },
})
if (is_windows) then
    table.insert(launch_menu, {
    label = 'PowerShell 5 (Native)',
    args = { 'powershell', '-NoLogo' },
    })
end







--- Default config settings

config.launch_menu = launch_menu
config.default_cursor_style = 'BlinkingBar'
config.mouse_bindings = mouse_bindings

return config