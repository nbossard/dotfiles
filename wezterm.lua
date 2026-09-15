-- Copyright (c) Nicolas BOSSARD
-- config for wezterm, Nicolas BOSSARD
-- setup initial : ln -s ~/dotfiles/wezterm.lua ~/.wezterm.lua
-- vim: set list foldmethod=syntax :

local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- home defined config keys
config.keys = {
  -- vim inspired commands
  { key = "h", mods = "CTRL", action = act.MoveTabRelative(-1) },
  { key = "l", mods = "CTRL", action = act.MoveTabRelative(1) },
  -- Move current pane/tab to a new window
  { key = "!", mods = "CTRL", action = wezterm.action_callback(function(_, pane)
      pane:move_to_new_window()
    end),
  },
}

config.font_size = 16.0
-- Wezterm changing the default fonts : https://wezterm.org/config/fonts.html
--
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
  elseif string.match(pane_title, "dotvim") then
    pane_bg_color = "green"
  elseif string.match(pane_title, "dotfiles") then
    pane_bg_color = "lightGreen"
  elseif string.match(pane_title, "obsperso") or string.match(pane_title, "obsp") then
    pane_bg_color = "orange"
  elseif string.match(pane_title, "book") then
    pane_bg_color = "#cc7000"
  elseif
    string.match(pane_title, "colima")
    or string.match(pane_title, "docker")
    or string.match(pane_title, "vi-mongo")
  then
    pane_bg_color = "grey"
  -- Pay metrics
  -- elseif string.match(pane_title, "bs.main") or string.match(pane_title, "bs.dev") or string.match(pane_title, "bs.tag") then
  --   pane_bg_color = "brown"
  -- Pay metrics - kibana transform vis
  -- elseif string.match(pane_title, "transform.vi.") then
  --   pane_bg_color = "#731d1d" --darker brown  -- Pay metrics - kibana transform vis
  -- elseif string.match(pane_title, "kibana") then
  --   pane_bg_color = "#421010" --darker darker brown
  -- MSP project
  elseif
    string.match(pane_title, "chatbot")
    or string.match(pane_title, "chatbot-dev")
    or string.match(pane_title, "GSMA")
    or string.match(pane_title, "validation")
  then
    pane_bg_color = "pink"
  elseif string.match(pane_title, "fraudr") then
    pane_bg_color = "cyan"
  elseif string.match(pane_title, "import33700") then
    pane_bg_color = "cyan"
  elseif string.match(pane_title, "photos_perso") then
    pane_bg_color = "blue"
  elseif string.match(pane_title, "o-cli") then
    pane_bg_color = "brown"
  elseif
    string.match(pane_title, "imp33700")
    or string.match(pane_title, "searchin33700")
    or string.match(pane_title, "common")
  then
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
    { Foreground = { Color = pane_fg_color } },
    { Background = { Color = pane_bg_color } },
    { Text = " " .. pane_title .. " " },
  }
end)

-- Launch programs at startup automatically
-- quiet tricky, solution found here : https://github.com/wezterm/wezterm/issues/3646
wezterm.on("gui-startup", function()
  -- dot files
  local _, another_pane, window = wezterm.mux.spawn_window({})
  another_pane:send_text("cd dotfiles\nwrt dotfiles\nnvim\n")
  --
  -- dotvim
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd dotvim\nwrt dotvim\nnvim\n")
  --
  -- colima
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("wrt colima\ncolima start -f")
  --
  -- lazydocker
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("wrt lazydocker\nlazydocker\n")
  --
  -- vi-mongo - tui for mongodb
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("wrt vi-mongo\nvi-mongo --connection-name localhost -j scam-report/item33700")
  --
  -- btop
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("wrt btop\nbtop -u 1500")
  --
  -- obsperso - personal obsidian vault
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd perso/obsidian/obsperso\nwrt obsperso\n")
  --
  -- obsperso - opencode nutrition
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd obsperso\nwrt opencode\nopencode\n")
  --
  -- obsperso - jjui
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd obsperso\nwrt jjui\njjui\n")
  --
  -- photos_perso - personal photo management
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd perso/photos_perso\nwrt photos_perso\nbat README.md -p\n")
  -- photos_perso ssh raspberry pi
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("wrt photos_perso\nssh -p 31415 -t ftpuser@rasp5gitphotos-ethernet 'cd ftp/photos/dailys && exec $SHELL -l'\n")
  --
  -- book albin
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd perso/book\nwrt book\n")
  --
  -- llm functions, given up, now using opencode
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd perso/llm-functions\nwrt llm-functions\nnvim\n"
  -- Replaced by github copilot
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "wrt tabby;tabby serve --device metal --model StarCoder-3B\n"
  --
  -- business server, closed project
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd PilotageDistri/business-server\nwrt bs-main\n"
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd PilotageDistri/business-server-dev\nwrt bs-dev\n"
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd PilotageDistri/business-server-taggage\nwrt bs-tag\n"
  --
  -- chatbot
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd my-security-partner/chatbot\nwrt chatbot\n"
  -- chatbot test run
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd my-security-partner/chatbot\nwrt chatbot\n"
  -- chatbot jjui interface
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd my-security-partner/chatbot\njjui\n"
  -- chatbot opencode
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd my-security-partner/chatbot\nopencode\n"
  -- chatbot dev
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd my-security-partner/chatbot-dev\nwrt chatbot\n"
  -- gsma bot server
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd my-security-partner/gsma-bot-server\nwrt GSMA\n"
  --gsma-bot-server opencode
  -- _, another_pane, _ = window:spawn_tab {}
  -- another_pane:send_text "cd my-security-partner/gsma-bot-server\nopencode\n"
  --
  -- scam report
  -- import33700
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/fraudr/import33700\nwrt imp33700\n")
  -- scam-report run server
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/scam-report\nnpm run start")
  -- scam-report nvim
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/scam-report\nnvim\n")
  -- scam-report opencode
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/scam-report\nopencode\n")
  -- scam-report jjui
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/scam-report\njjui\n")
  -- scam-report glab-tui
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/scam-report\nglab-tui")
  -- scam-report GCP tunneling, using script provided by Michael LETOUZEY
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/GCP\nwrt GCP\n./gcp_tunnel.sh dev")
  -- scam-report k9S, requires GCP tunneling to be active
  _, another_pane, _ = window:spawn_tab({})
  another_pane:send_text("cd my-security-partner/scam-report\necho Requires GCP tunneling to be launched first!!\nk9s")
end)

-- Generic configuration
return config
