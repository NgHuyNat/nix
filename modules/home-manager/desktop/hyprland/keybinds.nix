# Custom keybindings for Hyprland
{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    # Overview toggle on Super key release
    bindr = [
      "$mainMod, SUPER_L, exec, qs -c $qsConfig ipc call overview toggle"
      "$mainMod, SUPER_R, exec, qs -c $qsConfig ipc call overview toggle"
    ];

    # Shell
    bind = [
      "$mainMod, Tab, exec, pkill fuzzel || fuzzel"
      
      "Ctrl, Super_L, global, quickshell:overviewToggleReleaseInterrupt"
      "Ctrl, Super_R, global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse:272, global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse:273, global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse:274, global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse:275, global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse:276, global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse:277, global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse_up,  global, quickshell:overviewToggleReleaseInterrupt"
      "$mainMod, mouse_down,global, quickshell:overviewToggleReleaseInterrupt"
      
      "$mainMod+Alt, A, global, quickshell:sidebarLeftToggleDetach"
      "$mainMod, B, global, quickshell:sidebarLeftToggle"
      "$mainMod, O, global, quickshell:sidebarLeftToggle"
      
      "Ctrl+Alt, Delete, exec, qs -c $qsConfig ipc call TEST_ALIVE || pkill wlogout || wlogout -p layer-shell"
      "Shift+$mainMod+Alt, Slash, exec, qs -p ~/.config/quickshell/$qsConfig/welcome.qml"
      "Ctrl+$mainMod, R, exec, killall ags agsv1 gjs ydotool qs quickshell; qs -c $qsConfig &"

      # Window Focusing
      "$mainMod, Left, movefocus, l"
      "$mainMod, Right, movefocus, r"
      "$mainMod, Up, movefocus, u"
      "$mainMod, Down, movefocus, d"
      "$mainMod, BracketLeft, movefocus, l"
      "$mainMod, BracketRight, movefocus, r"

      # Window Moving
      "$mainMod+Shift, Left, movewindow, l"
      "$mainMod+Shift, Right, movewindow, r"
      "$mainMod+Shift, Up, movewindow, u"
      "$mainMod+Shift, Down, movewindow, d"

      # Window Actions
      "Alt, F4, killactive,"
      "$mainMod, Q, killactive,"
      "$mainMod+Shift+Alt, Q, exec, hyprctl kill"
      
      # Positioning mode
      "$mainMod+Alt, Space, togglefloating,"
      "$mainMod, D, fullscreen, 1"
      "$mainMod, F, fullscreen, 0"
      "$mainMod+Alt, F, fullscreenstate, 0 3"
      "$mainMod, P, pin"

      # Workspace Actions (Silent Move)
      "$mainMod+Alt, 1, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 1"
      "$mainMod+Alt, 2, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 2"
      "$mainMod+Alt, 3, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 3"
      "$mainMod+Alt, 4, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 4"
      "$mainMod+Alt, 5, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 5"
      "$mainMod+Alt, 6, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 6"
      "$mainMod+Alt, 7, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 7"
      "$mainMod+Alt, 8, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 8"
      "$mainMod+Alt, 9, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 9"
      "$mainMod+Alt, 0, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh movetoworkspacesilent 10"

      # Workspace Scroll/Move
      "$mainMod+Shift, mouse_down, movetoworkspace, r-1"
      "$mainMod+Shift, mouse_up, movetoworkspace, r+1"
      "$mainMod+Alt, mouse_down, movetoworkspace, -1"
      "$mainMod+Alt, mouse_up, movetoworkspace, +1"
      
      "$mainMod+Alt, Page_Down, movetoworkspace, +1"
      "$mainMod+Alt, Page_Up, movetoworkspace, -1"
      "$mainMod+Shift, Page_Down, movetoworkspace, r+1"
      "$mainMod+Shift, Page_Up, movetoworkspace, r-1"
      "Ctrl+$mainMod+Shift, Right, movetoworkspace, r+1"
      "Ctrl+$mainMod+Shift, Left, movetoworkspace, r-1"

      "$mainMod+Alt, S, movetoworkspacesilent, special"

      "Ctrl+$mainMod, S, togglespecialworkspace,"
      "Alt, Tab, cyclenext"
      "Alt, Tab, bringactivetotop,"

      # Workspace Switching
      "$mainMod, 1, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 1"
      "$mainMod, 2, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 2"
      "$mainMod, 3, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 3"
      "$mainMod, 4, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 4"
      "$mainMod, 5, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 5"
      "$mainMod, 6, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 6"
      "$mainMod, 7, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 7"
      "$mainMod, 8, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 8"
      "$mainMod, 9, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 9"
      "$mainMod, 0, exec, ~/.config/hypr/hyprland/scripts/workspace_action.sh workspace 10"

      "Ctrl+$mainMod, Right, workspace, r+1"
      "Ctrl+$mainMod, Left, workspace, r-1"
      
      "Ctrl+$mainMod+Alt, Right, workspace, m+1"
      "Ctrl+$mainMod+Alt, Left, workspace, m-1"
      
      "$mainMod, Page_Down, workspace, +1"
      "$mainMod, Page_Up, workspace, -1"
      "Ctrl+$mainMod, Page_Down, workspace, r+1"
      "Ctrl+$mainMod, Page_Up, workspace, r-1"
      
      "$mainMod, mouse_up, workspace, +1"
      "$mainMod, mouse_down, workspace, -1"
      "Ctrl+$mainMod, mouse_up, workspace, r+1"
      "Ctrl+$mainMod, mouse_down, workspace, r-1"

      # Monitor Special Workspace (Scratchpad)
      "$mainMod, S, togglespecialworkspace,"
      "$mainMod, mouse:275, togglespecialworkspace,"
      "Ctrl+$mainMod, BracketLeft, workspace, -1"
      "Ctrl+$mainMod, BracketRight, workspace, +1"
      "Ctrl+$mainMod, Up, workspace, r-5"
      "Ctrl+$mainMod, Down, workspace, r+5"

      # Audio / Media (Non-locking)
      "$mainMod+Shift+Alt, mouse:275, exec, playerctl previous"
      "$mainMod+Shift+Alt, mouse:276, exec, playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"

      # Apps
      "$mainMod, Return, exec, kitty"
      "$mainMod, T, exec, kitty"
      "Ctrl+Alt, T, exec, kitty"
      "$mainMod, E, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"dolphin\" \"nautilus\" \"nemo\" \"thunar\" \"\${TERMINAL}\" \"kitty -1 zsh -c yazi\""
      "$mainMod, W, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"google-chrome-stable\" \"firefox\" \"coccoc-browser-stable\" \"zen-browser\" \"brave\" \"chromium\" \"microsoft-edge-stable\" \"opera\" \"librewolf\""
      "$mainMod, C, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"code\" \"codium\" \"cursor\" \"zed\" \"zedit\" \"zeditor\" \"kate\" \"gnome-text-editor\" \"emacs\" \"command -v nvim && kitty -1 nvim\" \"command -v micro && kitty -1 micro\""
      "$mainMod+Shift, W, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"wps\" \"onlyoffice-desktopeditors\""
      "$mainMod, X, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"kate\" \"gnome-text-editor\" \"emacs\""
      "Ctrl+$mainMod, V, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"pavucontrol-qt\" \"pavucontrol\""
      "$mainMod, I, exec, XDG_CURRENT_DESKTOP=gnome ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"qs -p ~/.config/quickshell/$qsConfig/settings.qml\" \"systemsettings\" \"gnome-control-center\" \"better-control\""
      "Ctrl+Shift, Escape, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"gnome-system-monitor\" \"plasma-systemmonitor --page-name Processes\" \"command -v btop && kitty -1 zsh -c btop\""
      "$mainMod+Shift,D, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"nwg-displays\""
      "Ctrl+Shift, D, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"vesktop\" \"discord\""
      "$mainMod+Shift, C, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh \"Telegram\" \"signal-desktop\" \"element-desktop\""

      # Cursed stuff
      "Ctrl+$mainMod, Backslash, resizeactive, exact 640 480"
      
      # Override quickshell screenshot keybind
      "$mainMod+Shift, S, exec, pkill slurp; mkdir -p $(xdg-user-dir PICTURES)/Screenshots && grim -g \"$(slurp)\" - | tee $(xdg-user-dir PICTURES)/Screenshots/Screenshot_\"$(date '+%Y-%m-%d_%H.%M.%S')\".png | wl-copy && notify-send \"Screenshot\" \"Saved to ~/Pictures/Screenshots\""
    ];

    bindit = [
      ",Super_L, global, quickshell:workspaceNumber"
      ",Super_R, global, quickshell:workspaceNumber"
    ];

    bindd = [
      "$mainMod, V, Clipboard history >> clipboard, global, quickshell:overviewClipboardToggle"
      "$mainMod, Period, Emoji >> clipboard, global, quickshell:overviewEmojiToggle"
      "$mainMod, A, Toggle left sidebar, global, quickshell:sidebarLeftToggle"
      "$mainMod, N, Toggle right sidebar, global, quickshell:sidebarRightToggle"
      "$mainMod, Slash, Toggle cheatsheet, global, quickshell:cheatsheetToggle"
      "$mainMod, K, Toggle on-screen keyboard, global, quickshell:oskToggle"
      "$mainMod, M, Toggle media controls, global, quickshell:mediaControlsToggle"
      "Ctrl+Alt, Delete, Toggle session menu, global, quickshell:sessionToggle"
      "$mainMod, J, Toggle bar, global, quickshell:barToggle"
      "Ctrl+$mainMod, T, Toggle wallpaper selector, global, quickshell:wallpaperSelectorToggle"
      "Ctrl+$mainMod, T, Change wallpaper, exec, qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/quickshell/$qsConfig/scripts/colors/switchwall.sh"
      
      # Utilities
      "$mainMod, V, Copy clipboard history entry, exec, qs -c $qsConfig ipc call TEST_ALIVE || pkill fuzzel || cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy"
      "$mainMod, Period, Copy an emoji, exec, qs -c $qsConfig ipc call TEST_ALIVE || pkill fuzzel || ~/.config/hypr/hyprland/scripts/fuzzel-emoji.sh copy"
      "$mainMod+Shift, T, Character recognition,exec,pkill slurp; grim -g \"$(slurp)\" \"tmp.png\" && tesseract \"tmp.png\" - | wl-copy && rm \"tmp.png\""
      "$mainMod+Shift, C, Color picker, exec, hyprpicker -a"
      
      "$mainMod+Alt, R, Record region (no sound), exec, ~/.config/hypr/hyprland/scripts/record.sh"
      "Ctrl+Alt, R, Record screen (no sound), exec, ~/.config/hypr/hyprland/scripts/record.sh --fullscreen"
      "$mainMod+Shift+Alt, R, Record screen (with sound), exec, ~/.config/hypr/hyprland/scripts/record.sh --fullscreen-sound"
      
      "$mainMod+Shift+Alt, mouse:273, Generate AI summary for selected text, exec, ~/.config/hypr/hyprland/scripts/ai/primary-buffer-query.sh"
      
      "$mainMod, L, Lock, exec, loginctl lock-session"
      "Ctrl+Shift+Alt+$mainMod, Delete, Shutdown, exec, systemctl poweroff || loginctl poweroff"
    ];

    bindle = [
      ", XF86MonBrightnessUp, exec, qs -c $qsConfig ipc call brightness increment || brightnessctl s 5%+"
      ", XF86MonBrightnessDown, exec, qs -c $qsConfig ipc call brightness decrement || brightnessctl s 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
      "$mainMod, Minus, exec, qs -c $qsConfig ipc call zoom zoomOut"
      "$mainMod, Equal, exec, qs -c $qsConfig ipc call zoom zoomIn"
      "$mainMod, Minus, exec, qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.1"
      "$mainMod, Equal, exec, qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh increase 0.1"
    ];

    bindl = [
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
      "Alt ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
      
      "$mainMod+Shift, N, exec, playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"
      ",XF86AudioNext, exec, playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"
      ",XF86AudioPrev, exec, playerctl previous"
      
      "$mainMod+Shift, B, exec, playerctl previous"
      "$mainMod+Shift, P, exec, playerctl play-pause"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPause, exec, playerctl play-pause"
      ", XF86PowerOff, exec, pgrep -x wlogout > /dev/null || wlogout"
    ];

    bindld = [
      "$mainMod+Shift,M, Toggle mute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
      "$mainMod,F1, Toggle mic, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
      ",Print, Screenshot >> clipboard, exec, pkill slurp; grim -g \"$(slurp)\" - | wl-copy && notify-send \"Screenshot\" \"Copied to clipboard\""
      "$mainMod+Shift, L, Suspend system, exec, systemctl suspend || loginctl suspend"
    ];
    
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:274, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    binde = [
      "$mainMod, Semicolon, splitratio, -0.1"
      "$mainMod, Apostrophe, splitratio, +0.1"
    ];
  };
}
