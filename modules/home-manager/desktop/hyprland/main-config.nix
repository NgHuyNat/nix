# Main Hyprland configuration override
{ config, pkgs, lib, end-4-dots, ... }:

{
  # No need for main-config.nix - hyprland.conf is sourced from dotfiles.nix
  # monitors, workspaces, input are managed via separate Nix modules
}
