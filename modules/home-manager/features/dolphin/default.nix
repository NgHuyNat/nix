# 🐬 DOLPHIN FILE MANAGER CONFIGURATION
# Dolphin (KDE File Manager) settings for NixOS
{ config, pkgs, ... }:

{
  # === DOLPHIN CONFIGURATION ===
  # Dolphin is already installed in desktop/hyprland.nix
  
  # === XDG MIME ASSOCIATIONS ===
  # Set Dolphin as default file manager for directory/folder types
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "org.kde.dolphin.desktop";
      "application/x-gnome-saved-search" = "org.kde.dolphin.desktop";
    };
  };
}
