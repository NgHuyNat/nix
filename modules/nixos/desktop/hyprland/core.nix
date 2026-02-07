{ config, pkgs, lib, hyprland, ... }:

{
  # Hyprland core configuration  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  # Core system services
  security.polkit.enable = true;
  services.gvfs.enable = true;

  # Environment variables for Hyprland
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };
  
  # Essential core packages
  environment.systemPackages = with pkgs; [
    # Core window manager packages
    # (Removed manual hacks)
    
    # Essential Hyprland utilities
    hyprlock
    hyprpicker
    hyprcursor
    
    # Core applications
    kitty           # Terminal emulator
    kdePackages.dolphin  # File manager
  ];
}
