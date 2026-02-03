{ config, pkgs, ... }:

{
  # Display manager
  services.xserver = {
    enable = true;
  };


  services.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
    sddm = {
      enable = false;
    };
  };

  # Hyprland is configured in hyprland.nix
  services.desktopManager = {
    plasma6 = {
      enable = false;
    };
    gnome = {
      enable = true;
    };
  };
}