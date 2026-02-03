{ config, lib, pkgs, hostVars, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";

      # Shell
      bindid = [
        #"$mainMod, Super_L, Toggle overview, global, quickshell:overviewToggleRelease" # Toggle overview/launcher
        #"$mainMod, Super_R, Toggle overview, global, quickshell:overviewToggleRelease" # [hidden] Toggle overview/launcher
        # "$mainMod, Tab, exec, pkill fuzzel || fuzzel" # App launcher
      ];

      bind = [
        "$mainMod, Tab, exec, pkill fuzzel || fuzzel" # App launcher
        # Shell
        
        "Ctrl, Super_L, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "Ctrl, Super_R, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse:272, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse:273, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse:274, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse:275, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse:276, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse:277, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse_up,  global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        "$mainMod, mouse_down,global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
        
        "$mainMod+Alt, A, global, quickshell:sidebarLeftToggleDetach" # [hidden]
        "$mainMod, B, global, quickshell:sidebarLeftToggle" # [hidden]
        "$mainMod, O, global, quickshell:sidebarLeftToggle" # [hidden]
        
        "Ctrl+Alt, Delete, exec, qs -c $qsConfig ipc call TEST_ALIVE || pkill wlogout || wlogout -p layer-shell" # [hidden] Session menu (fallback)
        "Shift+$mainMod+Alt, Slash, exec, qs -p ~/.config/quickshell/$qsConfig/welcome.qml" # [hidden] Launch welcome app
        "Ctrl+$mainMod, R, exec, killall ags agsv1 gjs ydotool qs quickshell; qs -c $qsConfig &" # Restart widgets

        # Window Focusing
        "$mainMod, Left, movefocus, l" # [hidden]
        "$mainMod, Right, movefocus, r" # [hidden]
        "$mainMod, Up, movefocus, u" # [hidden]
        "$mainMod, Down, movefocus, d" # [hidden]
        "$mainMod, BracketLeft, movefocus, l" # [hidden]
        "$mainMod, BracketRight, movefocus, r" # [hidden]

        # Window Moving
        "$mainMod+Shift, Left, movewindow, l" # [hidden]
        "$mainMod+Shift, Right, movewindow, r" # [hidden]
        "$mainMod+Shift, Up, movewindow, u" # [hidden]
        "$mainMod+Shift, Down, movewindow, d" # [hidden]

        # Window Actions
        "Alt, F4, killactive," # [hidden] Close (Windows)
        "$mainMod, Q, killactive," # Close
        "$mainMod+Shift+Alt, Q, exec, hyprctl kill" # Forcefully zap a window
        
        # Positioning mode
        "$mainMod+Alt, Space, togglefloating," # Float/Tile
        "$mainMod, D, fullscreen, 1" # Maximize
        "$mainMod, F, fullscreen, 0" # Fullscreen
        "$mainMod+Alt, F, fullscreenstate, 0 3" # Fullscreen spoof
        "$mainMod, P, pin" # Pin

        # Workspace Actions (Silent Move)
        "$mainMod+Alt, 1, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 1" # [hidden]
        "$mainMod+Alt, 2, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 2" # [hidden]
        "$mainMod+Alt, 3, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 3" # [hidden]
        "$mainMod+Alt, 4, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 4" # [hidden]
        "$mainMod+Alt, 5, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 5" # [hidden]
        "$mainMod+Alt, 6, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 6" # [hidden]
        "$mainMod+Alt, 7, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 7" # [hidden]
        "$mainMod+Alt, 8, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 8" # [hidden]
        "$mainMod+Alt, 9, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 9" # [hidden]
        "$mainMod+Alt, 0, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 10" # [hidden]

        # Workspace Scroll/Move
        "$mainMod+Shift, mouse_down, movetoworkspace, r-1" # [hidden]
        "$mainMod+Shift, mouse_up, movetoworkspace, r+1" # [hidden]
        "$mainMod+Alt, mouse_down, movetoworkspace, -1" # [hidden]
        "$mainMod+Alt, mouse_up, movetoworkspace, +1" # [hidden]
        
        "$mainMod+Alt, Page_Down, movetoworkspace, +1" # [hidden]
        "$mainMod+Alt, Page_Up, movetoworkspace, -1" # [hidden]
        "$mainMod+Shift, Page_Down, movetoworkspace, r+1"  # [hidden]
        "$mainMod+Shift, Page_Up, movetoworkspace, r-1"  # [hidden]
        "Ctrl+$mainMod+Shift, Right, movetoworkspace, r+1" # [hidden]
        "Ctrl+$mainMod+Shift, Left, movetoworkspace, r-1" # [hidden]

        "$mainMod+Alt, S, movetoworkspacesilent, special" # Send to scratchpad

        "Ctrl+$mainMod, S, togglespecialworkspace," # [hidden]
        "Alt, Tab, cyclenext" # [hidden] sus keybind
        "Alt, Tab, bringactivetotop," # [hidden] bring it to the top

        # Workspace Switching
        "$mainMod, 1, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 1" # [hidden]
        "$mainMod, 2, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 2" # [hidden]
        "$mainMod, 3, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 3" # [hidden]
        "$mainMod, 4, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 4" # [hidden]
        "$mainMod, 5, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 5" # [hidden]
        "$mainMod, 6, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 6" # [hidden]
        "$mainMod, 7, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 7" # [hidden]
        "$mainMod, 8, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 8" # [hidden]
        "$mainMod, 9, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 9" # [hidden]
        "$mainMod, 0, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 10" # [hidden]

        "Ctrl+$mainMod, Right, workspace, r+1" # [hidden]
        "Ctrl+$mainMod, Left, workspace, r-1" # [hidden]
        
        "Ctrl+$mainMod+Alt, Right, workspace, m+1" # [hidden]
        "Ctrl+$mainMod+Alt, Left, workspace, m-1" # [hidden]
        
        "$mainMod, Page_Down, workspace, +1" # [hidden]
        "$mainMod, Page_Up, workspace, -1" # [hidden]
        "Ctrl+$mainMod, Page_Down, workspace, r+1" # [hidden]
        "Ctrl+$mainMod, Page_Up, workspace, r-1" # [hidden]
        
        "$mainMod, mouse_up, workspace, +1" # [hidden]
        "$mainMod, mouse_down, workspace, -1" # [hidden]
        "Ctrl+$mainMod, mouse_up, workspace, r+1" # [hidden]
        "Ctrl+$mainMod, mouse_down, workspace, r-1" # [hidden]

        # Monitor Special Workspace (Scratchpad)
        "$mainMod, S, togglespecialworkspace," # Toggle scratchpad
        "$mainMod, mouse:275, togglespecialworkspace," # [hidden]
        "Ctrl+$mainMod, BracketLeft, workspace, -1" # [hidden]
        "Ctrl+$mainMod, BracketRight, workspace, +1" # [hidden]
        "Ctrl+$mainMod, Up, workspace, r-5" # [hidden]
        "Ctrl+$mainMod, Down, workspace, r+5" # [hidden]

        # Testing
        "$mainMod+Alt, f11, exec, bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i \"nipple\" | grep -v -i \"pussy\" | shuf -n 1); ACTION=$(notify-send \"Test notification with body image\" \"This notification should contain your user account <b>image</b> and <a href=\\\"https://discord.com/app\\\">Discord</a> <b>icon</b>. Oh and here is a random image in your Pictures folder: <img src=\\\"$RANDOM_IMAGE\\\" alt=\\\"Testing image\\\"/>\" -a \"Hyprland keybind\" -p -h \"string:image-path:/var/lib/AccountsService/icons/$USER\" -t 6000 -i \"discord\" -A \"openImage=Open profile image\" -A \"action2=Open the random image\" -A \"action3=Useless button\"); [[ $ACTION == *openImage ]] && xdg-open \"/var/lib/AccountsService/icons/$USER\"; [[ $ACTION == *action2 ]] && xdg-open \"$RANDOM_IMAGE\"'" # [hidden]
        "$mainMod+Alt, f12, exec, bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i \"nipple\" | grep -v -i \"pussy\" | shuf -n 1); ACTION=$(notify-send \"Test notification\" \"This notification should contain a random image in your <b>Pictures</b> folder and <a href=\\\"https://discord.com/app\\\">Discord</a> <b>icon</b>.\\n<i>Flick right to dismiss!</i>\" -a \"Discord (fake)\" -p -h \"string:image-path:$RANDOM_IMAGE\" -t 6000 -i \"discord\" -A \"openImage=Open profile image\" -A \"action2=Useless button\" -A \"action3=Cry more\"); [[ $ACTION == *openImage ]] && xdg-open \"/var/lib/AccountsService/icons/$USER\"'" # [hidden]
        "$mainMod+Alt, Equal, exec, notify-send \"Urgent notification\" \"Ah hell no\" -u critical -a 'Hyprland keybind'" # [hidden]
        
        # Audio / Media (Non-locking)
        "$mainMod+Shift+Alt, mouse:275, exec, playerctl previous" # [hidden]
        "$mainMod+Shift+Alt, mouse:276, exec, playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`" # [hidden]

        # Apps
        "$mainMod, Return, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"\${TERMINAL}\" \"kitty -1\" \"foot\" \"alacritty\" \"wezterm\" \"konsole\" \"kgx\" \"uxterm\" \"xterm\"" # Terminal
        "$mainMod, T, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh  \"\${TERMINAL}\" \"kitty -1\" \"foot\" \"alacritty\" \"wezterm\" \"konsole\" \"kgx\" \"uxterm\" \"xterm\"" # [hidden] (terminal) (alt)
        "Ctrl+Alt, T, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"\${TERMINAL}\" \"kitty -1\" \"foot\" \"alacritty\" \"wezterm\" \"konsole\" \"kgx\" \"uxterm\" \"xterm\"" # [hidden] (terminal) (for Ubuntu people)
        "$mainMod, E, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"dolphin\" \"nautilus\" \"nemo\" \"thunar\" \"\${TERMINAL}\" \"kitty -1 fish -c yazi\"" # File manager
        "$mainMod, W, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh  \"firefox\" \"coccoc-browser-stable\" \"google-chrome-stable\" \"zen-browser\" \"brave\" \"chromium\" \"microsoft-edge-stable\" \"opera\" \"librewolf\"" # Browser
        "$mainMod, C, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"code\" \"codium\" \"cursor\" \"zed\" \"zedit\" \"zeditor\" \"kate\" \"gnome-text-editor\" \"emacs\" \"command -v nvim && kitty -1 nvim\" \"command -v micro && kitty -1 micro\"" # Code editor
        "$mainMod+Shift, W, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"wps\" \"onlyoffice-desktopeditors\"" # Office software
        "$mainMod, X, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"kate\" \"gnome-text-editor\" \"emacs\"" # Text editor
        "Ctrl+$mainMod, V, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"pavucontrol-qt\" \"pavucontrol\"" # Volume mixer
        "$mainMod, I, exec, XDG_CURRENT_DESKTOP=gnome ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"qs -p ~/.config/quickshell/$qsConfig/settings.qml\" \"systemsettings\" \"gnome-control-center\" \"better-control\"" # Settings app
        "Ctrl+Shift, Escape, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"gnome-system-monitor\" \"plasma-systemmonitor --page-name Processes\" \"command -v btop && kitty -1 fish -c btop\"" # Task manager
        "$mainMod+Shift,D, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"nwg-displays\"" # Display settings
        "Ctrl+Shift, D, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"vesktop\" \"discord\"" # Discord
        "$mainMod+Shift, C, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"Telegram\" \"signal-desktop\" \"element-desktop\"" # Chat app

        # Cursed stuff
        "Ctrl+$mainMod, Backslash, resizeactive, exact 640 480" # [hidden]
      ];

      # catchall keybinds are only allowed in submaps
      # binditn = [
      #   "Superv, catchall, global, quickshell:overviewToggleReleaseInterrupt" # [hidden]
      # ];

      bindit = [
        ",Super_L, global, quickshell:workspaceNumber" # [hidden]
        ",Super_R, global, quickshell:workspaceNumber" # [hidden]
      ];

      bindd = [
        "$mainMod, V, Clipboard history >> clipboard, global, quickshell:overviewClipboardToggle" # Clipboard history >> clipboard
        "$mainMod, Period, Emoji >> clipboard, global, quickshell:overviewEmojiToggle" # Emoji >> clipboard
        "$mainMod, Tab, Toggle overview, global, quickshell:overviewToggle" # [hidden] Toggle overview/launcher (alt)
        "$mainMod, A, Toggle left sidebar, global, quickshell:sidebarLeftToggle" # Toggle left sidebar
        "$mainMod, N, Toggle right sidebar, global, quickshell:sidebarRightToggle" # Toggle right sidebar
        "$mainMod, Slash, Toggle cheatsheet, global, quickshell:cheatsheetToggle" # Toggle cheatsheet
        "$mainMod, K, Toggle on-screen keyboard, global, quickshell:oskToggle" # Toggle on-screen keyboard
        "$mainMod, M, Toggle media controls, global, quickshell:mediaControlsToggle" # Toggle media controls
        "Ctrl+Alt, Delete, Toggle session menu, global, quickshell:sessionToggle" # Toggle session menu
        "$mainMod, J, Toggle bar, global, quickshell:barToggle" # Toggle bar
        "Ctrl+$mainMod, T, Toggle wallpaper selector, global, quickshell:wallpaperSelectorToggle" # Wallpaper selector
        "Ctrl+$mainMod, T, Change wallpaper, exec, qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/quickshell/$qsConfig/scripts/colors/switchwall.sh" # [hidden] Change wallpaper (fallback)
        
        # Utilities
        "$mainMod, V, Copy clipboard history entry, exec, qs -c $qsConfig ipc call TEST_ALIVE || pkill fuzzel || cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy" # [hidden] Clipboard history >> clipboard (fallback)
        "$mainMod, Period, Copy an emoji, exec, qs -c $qsConfig ipc call TEST_ALIVE || pkill fuzzel || ~/.config/hypr/hyprland/scripts/fuzzel-emoji.sh copy" # [hidden] Emoji >> clipboard (fallback)
        "$mainMod+Shift, S, Screen snip, exec, qs -c $qsConfig ipc call barService hide && sleep 0.2 && (qs -p ~/.config/quickshell/$qsConfig/screenshot.qml || pidof slurp || hyprshot --freeze --clipboard-only --mode region --silent); qs -c $qsConfig ipc call barService show" # Screen snip
        
        "$mainMod+Shift, T, Character recognition,exec,grim -g \"$(slurp $SLURP_ARGS)\" \"tmp.png\" && tesseract \"tmp.png\" - | wl-copy && rm \"tmp.png\"" # [hidden]
        "$mainMod+Shift, C, Color picker, exec, hyprpicker -a" # Pick color (Hex) >> clipboard
        
        "$mainMod+Alt, R, Record region (no sound), exec, ~/.config/hypr/hyprland/scripts/record.sh" # Record region (no sound)
        "Ctrl+Alt, R, Record screen (no sound), exec, ~/.config/hypr/hyprland/scripts/record.sh --fullscreen" # [hidden] Record screen (no sound)
        "$mainMod+Shift+Alt, R, Record screen (with sound), exec, ~/.config/hypr/hyprland/scripts/record.sh --fullscreen-sound" # Record screen (with sound)
        
        "$mainMod+Shift+Alt, mouse:273, Generate AI summary for selected text, exec, ~/.config/hypr/hyprland/scripts/ai/primary-buffer-query.sh" # AI summary for selected text
        
        "$mainMod, L, Lock, exec, loginctl lock-session" # Lock
        "Ctrl+Shift+Alt+$mainMod, Delete, Shutdown, exec, systemctl poweroff || loginctl poweroff" # [hidden] Power off
      ];

      bindle = [
        ", XF86MonBrightnessUp, exec, qs -c $qsConfig ipc call brightness increment || brightnessctl s 5%+" # [hidden]
        ", XF86MonBrightnessDown, exec, qs -c $qsConfig ipc call brightness decrement || brightnessctl s 5%-" # [hidden]
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+" # [hidden]
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-" # [hidden]
        "$mainMod, Minus, exec, qs -c $qsConfig ipc call zoom zoomOut" # Zoom out
        "$mainMod, Equal, exec, qs -c $qsConfig ipc call zoom zoomIn" # Zoom in
        "$mainMod, Minus, exec, qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.1" # [hidden] Zoom out
        "$mainMod, Equal, exec, qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh increase 0.1" # [hidden] Zoom in
      ];

      bindl = [
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle" # [hidden]
        "Alt ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle" # [hidden]
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle" # [hidden]
        
        "$mainMod+Shift, N, exec, playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`" # Next track
        ",XF86AudioNext, exec, playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`" # [hidden]
        ",XF86AudioPrev, exec, playerctl previous" # [hidden]
        
        "$mainMod+Shift, B, exec, playerctl previous" # Previous track
        "$mainMod+Shift, P, exec, playerctl play-pause" # Play/pause media
        ",XF86AudioPlay, exec, playerctl play-pause" # [hidden]
        ",XF86AudioPause, exec, playerctl play-pause" # [hidden]
        ", XF86PowerOff, exec, pgrep -x wlogout > /dev/null || wlogout"
      ];

      bindld = [
        "$mainMod+Shift,M, Toggle mute, exec, wpctl set-mute @DEFAULT_SINK@ toggle" # [hidden]
        "$mainMod,F1, Toggle mic, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle" # [hidden]
        ",Print, Screenshot >> clipboard ,exec,grim - | wl-copy" # Screenshot >> clipboard
        "Ctrl,Print, Screenshot >> clipboard & save, exec, mkdir -p $(xdg-user-dir PICTURES)/Screenshots && grim $(xdg-user-dir PICTURES)/Screenshots/Screenshot_\"$(date '+%Y-%m-%d_%H.%M.%S')\".png" # Screenshot >> clipboard & file
        "$mainMod+Shift, L, Suspend system, exec, systemctl suspend || loginctl suspend" # Sleep
      ];
      
      bindm = [
        "$mainMod, mouse:272, movewindow" # Move
        "$mainMod, mouse:274, movewindow" # [hidden]
        "$mainMod, mouse:273, resizewindow" # Resize
      ];

      binde = [
        "$mainMod, Semicolon, splitratio, -0.1" # [hidden]
        "$mainMod, Apostrophe, splitratio, +0.1" # [hidden]
      ];
    };
  };
}
