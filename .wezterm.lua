-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Instantiate the configuration
local config = wezterm.config_builder()

-- Apply configuration changes
config.color_scheme = 'Tokyo Night'
config.enable_scroll_bar = false
config.font_size = 11.0

if string.find(wezterm.target_triple, 'windows') ~= nil then
  config.default_prog = { 'pwsh.exe' }
  config.launch_menu = {
    {
      label = 'VS 2022 Developer Powershell',
      args = {
        'pwsh.exe',
        '-NoExit',
        '-Command',
        '& {Import-Module "C:\\Program Files\\' ..
          'Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll"; ' ..
          'Enter-VsDevShell 0f00ccaf -SkipAutomaticLocation -DevCmdArguments "-arch=arm64 -host_arch=arm64"}'
      }
    }
  }
end

return config
