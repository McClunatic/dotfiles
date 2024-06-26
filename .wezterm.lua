-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Instantiate the configuration
local config = wezterm.config_builder()

-- Apply configuration changes
config.color_scheme = 'Tokyo Night'
config.enable_scroll_bar = false

if string.find(wezterm.target_triple, 'windows') ~= nil then
  config.default_prog = { 'pwsh.exe' }
  config.launch_menu = {
    {
      label = 'VS 2022 Developer Powershell',
      args = {
        'pwsh.exe',
        '-NoExit',
        '-Command',
        '& {Import-Module "C:\\Program Files (x86)\\' ..
          'Microsoft Visual Studio\\2022\\BuildTools\\Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll"; ' ..
          'Enter-VsDevShell bcd29cc6 -SkipAutomaticLocation -DevCmdArguments "-arch=arm64 -host_arch=x64"}'
      }
    }
  }
end

return config
