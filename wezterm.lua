-- config for wezterm, Nicolas BOSSARD
-- setup initial : ln -s ~/dotfiles/wezterm.lua ~/.wezterm.lua
-- vim: set list foldmethod=syntax :

local wezterm = require 'wezterm';
local act = wezterm.action

local config ={}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- home defined config keys
config.keys = {
  -- vim inspired commands
  { key = 'h', mods = 'CTRL', action = act.MoveTabRelative(-1), },
  { key = 'l', mods = 'CTRL', action = act.MoveTabRelative(1), },
}

config.font_size = 16.0
-- changing the font
-- See catalog :https://www.nerdfonts.com/font-downloads
-- install using : brew tap homebrew/cask-fonts
-- then
-- moche :
-- brew install --cask font-0xProto-nerd-font
-- config.font = wezterm.font '0xProto Nerd Font'
-- Sympa : mais moins lisible que la fonte par défaut
-- brew install --cask font-roboto-mono-nerd-font
-- config.font = wezterm.font 'RobotoMono Nerd Font'

-- Function to allow renaming of tab
-- see https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
-- See https://github.com/wez/wezterm/issues/522#issuecomment-902203635
-- usage ~/dotfiles/rename_wezterm_title.sh newname
-- hover boolean means mouse is over the tab title
wezterm.on("format-tab-title", function(tab)
  local pane_title = tab.active_pane.title
  local user_title = tab.active_pane.user_vars.panetitle
  local pane_bg_color
  local pane_fg_color

  if user_title ~= nil and #user_title > 0 then
    pane_title = user_title
  end

  -- if pane_title contains "documentation" then change the background color
  if string.match(pane_title, "documentation") then
    pane_bg_color = "purple"
  elseif string.match(pane_title, "backend") then
    pane_bg_color = "orange"
  elseif string.match(pane_title, "vimrc") then
    pane_bg_color = "green"
  elseif string.match(pane_title, "dotvim") then
    pane_bg_color = "green"
  elseif string.match(pane_title, "back") and string.match(pane_title, "office") then
    pane_bg_color = "pink"
  elseif string.match(pane_title, "taskwarrior") then
    pane_bg_color = "darkGrey"
  elseif string.match(pane_title, "dotfiles") then
    pane_bg_color = "lightGreen"
  else
    pane_bg_color = "black"
  end

  if tab.is_active then
    pane_fg_color = "red"
  else
    pane_fg_color = "white"
  end

  return {

    -- default color
    {Foreground={Color=pane_fg_color}},
    {Background={Color=pane_bg_color}},
    {Text=" " .. pane_title .. " "},
  }
end)

-- Launch programs at startup automatically
-- quiet tricky, solution found here : https://github.com/wezterm/wezterm/issues/3646
wezterm.on('gui-startup', function()
  local _, another_pane, window = wezterm.mux.spawn_window {}
  another_pane:send_text "cd dotfiles\nwrt dotfiles\nnvim\n"
  _, another_pane, _ = window:spawn_tab {}
  another_pane:send_text "cd dotvim\nwrt dotvim\nnvim\n"
  _, another_pane, _ = window:spawn_tab {}
  another_pane:send_text "colima start -f\n"
  _, another_pane, _ = window:spawn_tab {}
  another_pane:send_text "wrt tabby;tabby serve --device metal --model StarCoder-3B\n"
  _, another_pane, _ = window:spawn_tab {}
  another_pane:send_text "cd PilotageDistri/business-server\nwrt bs-main\n"
  _, another_pane, _ = window:spawn_tab {}
  another_pane:send_text "cd PilotageDistri/business-server-dev\nwrt bs-dev\n"
  _, another_pane, _ = window:spawn_tab {}
  another_pane:send_text "cd PilotageDistri/business-server-taggage\nwrt bs-tag\n"
end)

-- Generic configuration
return config
