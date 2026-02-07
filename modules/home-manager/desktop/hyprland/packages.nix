# Quickshell wrapper and required runtime dependencies
{ config, pkgs, lib, unstable, quickshell, ... }:

let
  # Qt dependencies for Quickshell
  syntaxHighlighting = unstable.kdePackages.syntax-highlighting;
  qt5compat = unstable.kdePackages.qt5compat;
  qtpositioning = unstable.kdePackages.qtpositioning;
  kirigami = unstable.kdePackages.kirigami;
  
  # Create a properly wrapped quickshell with Qt dependencies  
  # Use unwrapped kirigami which contains actual QML files
  kirigamiUnwrapped = kirigami.unwrapped or kirigami;
  
  quickshellWrapped = pkgs.stdenv.mkDerivation {
    name = "quickshell-wrapped";
    buildInputs = [ pkgs.makeWrapper ];
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      makeWrapper ${quickshell.packages.${pkgs.system}.default}/bin/qs $out/bin/qs \
        --prefix QML2_IMPORT_PATH : "${kirigamiUnwrapped}/lib/qt-6/qml" \
        --prefix QML2_IMPORT_PATH : "${syntaxHighlighting}/lib/qt-6/qml" \
        --prefix QML2_IMPORT_PATH : "${qt5compat}/lib/qt-6/qml" \
        --prefix QML2_IMPORT_PATH : "${qtpositioning}/lib/qt-6/qml"
    '';
  };
in
{
  # Required Runtime Dependencies for End-4
  home.packages = [
    # === QUICKSHELL AND DEPENDENCIES ===
    quickshellWrapped        # Quickshell from source with QML paths
    unstable.bun             # Required for Quickshell TS/JS runtime
    unstable.dart-sass       # Required for styling
    
    # === QT MODULES ===
    qt5compat                # Required for Qt5Compat.GraphicalEffects module
    unstable.kdePackages.qtlocation # Required for QtPositioning module
    unstable.kdePackages.qtwayland   # Required for Wayland support
    qtpositioning            # Required for QtPositioning module
    syntaxHighlighting       # Required for org.kde.syntaxhighlighting
    kirigami                 # Required for org.kde.kirigami
    
    # === UTILITIES ===
    pkgs.fd                  # Required by some scripts
    pkgs.brightnessctl       # Screen brightness
    pkgs.libsecret           # Provides secret-tool for keyring storage
    pkgs.imagemagick         # Provides magick for image processing
    pkgs.ddcutil             # DDC/CI monitor control
    
    # === THEMING ===
    pkgs.swww                # Wallpaper daemon
    pkgs.matugen             # Material You colors
    
    # === SCREENSHOT TOOLS ===
    pkgs.grim                # Screenshot tool
    pkgs.slurp               # Screen region selector
    pkgs.wl-clipboard        # Wayland clipboard utilities
    pkgs.swappy              # Screenshot annotation tool
  ];

  # Set QML import paths for quickshell
  home.sessionVariables = {
    QML2_IMPORT_PATH = lib.concatStringsSep ":" [
      "${unstable.kdePackages.kirigami}/lib/qt-6/qml"
      "${unstable.kdePackages.syntax-highlighting}/lib/qt-6/qml"
      "${unstable.kdePackages.qt5compat}/lib/qt-6/qml"
    ];
    # Qt platform and theme settings for better icon rendering
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk3";
    QT_STYLE_OVERRIDE = lib.mkForce "kvantum";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # Disable geoclue timeout warnings that cause crashes
    QT_LOGGING_RULES = "qt.positioning.geoclue2.warning=false";
  };
}
