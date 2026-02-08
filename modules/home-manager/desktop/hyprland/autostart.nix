# Autostart applications and services
{ config, lib, pkgs, hostVars, ... }:


{
  wayland.windowManager.hyprland.settings = {    
    exec-once = [
      "${hostVars.nix_config}/home/shared/hypr/scripts/hyprland/start_geoclue_agent.sh"
      "qs -c $qsConfig &" # QuickShell

      # Core components (authentication, lock screen, notification daemon)
      "gnome-keyring-daemon --start --components=secrets"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "hypridle"
      "dbus-update-activation-environment --all"
      "sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # Some fix idk"
      
      # Start Fcitx5 (use PATH to get the wrapped version with addons)
      "fcitx5 -d -r"
      
      "hyprpm reload"

      # Clipboard: history
      "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store && qs -c $qsConfig ipc call cliphistService update"
      "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store && qs -c $qsConfig ipc call cliphistService update"

      # Set cursor theme
      "hyprctl setcursor breeze_cursors 24"

      # Network management
      "${pkgs.networkmanagerapplet}/bin/nm-applet"

      # "otd-daemon" # Tablet
    ];
  };

  # Install required packages for autostart
  home.packages = with pkgs; [
    networkmanagerapplet
    swww
    blueman
    hypridle
    wl-clipboard
    cliphist
    polkit_gnome
  ];
}
