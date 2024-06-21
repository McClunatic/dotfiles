-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Instantiate the configuration
local config = wezterm.config_builder()

-- Apply configuration changes
config.color_scheme = 'Tokyo Night'
config.enable_scroll_bar = false

if string.find(wezterm.target_triple, 'windows') ~= nil then
  config.default_prog = { 'pwsh.exe' }
end

return config
