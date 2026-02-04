# ███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗ ███████╗
# ████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
# ██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝███████╗
# ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗╚════██║
# ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║███████║
# ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
# --------------------------------------------------------------------
# MONITORS - Được quản lý bởi nwg-displays
# Config được lưu tại: ~/.config/hypr/monitors.conf

{ config, lib, pkgs, hostVars, ... }:

{
  imports = [
    ./nwg-displays.nix
  ];

  wayland.windowManager.hyprland.settings = {
    # Cấu hình monitor fallback (được override bởi nwg-displays config)
    monitor = [
      "${hostVars.port_name}, ${hostVars.resolution}@${hostVars.frequency}, 0x0, 1"
      "${hostVars.secondary_monitor}, 1920x1080@180.00, 1920x0, 1"
    ];
  };
}
