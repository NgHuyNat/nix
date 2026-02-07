{ config, lib, pkgs, hostVars, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # Cấu hình monitor fallback (được override bởi nwg-displays config)
    monitor = [
      "${hostVars.port_name}, ${hostVars.resolution}@${hostVars.frequency}, 0x0, 1"
      "${hostVars.port_name2}, ${hostVars.resolution}@${hostVars.frequency}, 0x0, 1"
      "${hostVars.secondary_monitor}, 1920x1080@144.00, 1920x0, 1"
    ];
  };
}