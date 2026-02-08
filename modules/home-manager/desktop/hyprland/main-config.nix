# Main Hyprland configuration override
{ config, pkgs, lib, end-4-dots, ... }:

{
  # Import the base config from dotfiles (now renamed)
  wayland.windowManager.hyprland.extraConfig = ''
    source = ~/.config/hypr/hyprland-source.conf
  '';
}
