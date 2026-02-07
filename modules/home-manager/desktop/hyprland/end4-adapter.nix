{ config, pkgs, lib, end-4-dots, hyprland, ... }:

let
  # The path to the end-4 dots in the nix store
  dotsPath = end-4-dots + "/dots";
in
{
  # Link the entire hyprland config directory from the flake input
  xdg.configFile."hypr" = {
    source = "${dotsPath}/.config/hypr";
    recursive = true;
  };

  # Link other necessary configs
  xdg.configFile."quickshell" = {
    source = lib.mkForce "${dotsPath}/.config/quickshell";
    recursive = true;
  };

  xdg.configFile."kitty" = {
    source = "${dotsPath}/.config/kitty";
    recursive = true;
  };

  xdg.configFile."wlogout" = {
    source = "${dotsPath}/.config/wlogout";
    recursive = true;
  };
  
  xdg.configFile."matugen" = {
    source = "${dotsPath}/.config/matugen";
    recursive = true;
  };
  
  # Ensure Hyprland is enabled
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    # We don't use extraConfig here because we are linking the file directly
    # extraConfig = builtins.readFile "${dotsPath}/.config/hypr/hyprland.conf"; 
  };
}
