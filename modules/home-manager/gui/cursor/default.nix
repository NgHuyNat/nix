{ config, pkgs, ... }:

{
  # === CURSOR THEME CONFIGURATION ===
  home.pointerCursor = {
    name = "breeze_cursors";
    package = pkgs.kdePackages.breeze;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # === ENSURE CURSOR THEME FILES ARE AVAILABLE ===
  home.packages = with pkgs; [
    kdePackages.breeze
  ];
} 