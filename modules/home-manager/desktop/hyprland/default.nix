# End-4 Hyprland configuration adapter
# Main entry point that imports all sub-modules
{ config, pkgs, lib, end-4-dots, hyprland, unstable, hostVars, quickshell, ... }:

{
  imports = [
    ./dotfiles.nix      # Link End-4 dotfiles with patches
    ./monitors.nix      # Monitor configuration
    ./workspaces.nix    # Workspace configuration
    ./input.nix         # Input (keyboard, mouse, touchpad)
    ./main-config.nix   # Main Hyprland config override
    ./packages.nix      # Quickshell and dependencies
    ./keybinds.nix      # Custom keybindings
    ./autostart.nix     # Autostart applications
  ];

  # Enable Hyprland window manager
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
  };
}
