-- config for wezterm, Nicolas BOSSARD
-- setup initial : ln -s ~/dotfiles/wezterm.lua ~/.wezterm.lua
-- vim: set list foldmethod=syntax :

local wezterm = require 'wezterm';

-- Function to allow renaming of tab
-- see https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
-- See https://github.com/wez/wezterm/issues/522#issuecomment-902203635
-- usage ~/dotfiles/rename_wezterm_title.sh newname
-- hover boolean means mouse is over the tab title
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane_title = tab.active_pane.title
  local user_title = tab.active_pane.user_vars.panetitle

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
  elseif string.match(pane_title, "back") and string.match(pane_title, "office") then
    pane_bg_color = "pink"
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

-- Generic configuration
return {
  font_size = 15.0
}

