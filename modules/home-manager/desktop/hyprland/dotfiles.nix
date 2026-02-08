# Link End-4 dotfiles with compatibility patches
{ config, pkgs, lib, end-4-dots, ... }:

let
  dotsPath = end-4-dots + "/dots";

  # Filter and patch Hyprland config for compatibility
  hyprConfigDir = pkgs.runCommand "hypr-config-dir" {} ''
    mkdir -p $out
    cp -r ${dotsPath}/.config/hypr/* $out/
    chmod -R u+w $out
    rm -f $out/monitors.conf
    rm -f $out/input.conf
    rm -f $out/workspaces.conf

    # Rename main config to source config so Home Manager generally manages hyprland.conf
    mv $out/hyprland.conf $out/hyprland-source.conf

    # --- Patching for compatibility ---
    # Fix: config option <misc:on_focus_under_fullscreen> does not exist. (deprecated?)
    sed -i 's/^.*misc:on_focus_under_fullscreen.*$//g' $out/hyprland/general.conf

    # Fix: Invalid rule: match:class ..., no_blur on -> remove noblur entirely (deprecated)
    # noblur is no longer a valid window rule parameter in newer Hyprland versions
    sed -i 's/, noblur//g' $out/hyprland/rules.conf
    sed -i 's/noblur, //g' $out/hyprland/rules.conf
    sed -i 's/noblur//g' $out/hyprland/rules.conf
    sed -i 's/no_blur on//g' $out/hyprland/rules.conf

    # Fix: Invalid rule: match:title ..., center on -> center
    # Replacing `center on` with `center`
    sed -i 's/center on/center/g' $out/hyprland/rules.conf
    
    # Fix: float on -> float
    sed -i 's/float on/float/g' $out/hyprland/rules.conf
    
    # Fix: Remove all windowrule/windowrulev2 lines (deprecated in 0.53.0)
    # Hyprland 0.53.0 has breaking changes - simpler to remove all rules than convert
    sed -i '/^windowrule/d' $out/hyprland/rules.conf
    sed -i '/^windowrulev2/d' $out/hyprland/rules.conf
    
    # Fix: Comment out hyprexpo plugin config (plugin not installed)
    # This prevents "Invalid value 300 for finger count" errors
    sed -i '/^plugin {$/,/^}$/{ /hyprexpo/,/^    }$/ s/^/#/ }' $out/hyprland/general.conf
    
    # Remove source lines for files we manage via Nix settings
    sed -i '/^source=monitors\.conf/d' $out/hyprland-source.conf
    sed -i '/^source=input\.conf/d' $out/hyprland-source.conf
    sed -i '/^source=workspaces\.conf/d' $out/hyprland-source.conf
  '';
    # Filter and patch Quickshell config
    quickshellConfigDir = pkgs.runCommand "quickshell-config-dir" {} ''
    mkdir -p $out
    cp -r ${dotsPath}/.config/quickshell/* $out/
    chmod -R u+w $out
    
    # Patch Config.qml to unhide Fcitx
    # Remove "Fcitx" from the pinned list which acts as a blacklist when invertPinnedItems is true (default)
    sed -i 's/pinnedItems: \[ "Fcitx" \]/pinnedItems: []/' $out/ii/modules/common/Config.qml
    
    # Disable screenshot keybind by commenting out regionScreenshot in all QML files
    find $out -name "*.qml" -type f -exec sed -i 's/regionScreenshot/\/\/ regionScreenshot/g' {} \;
  '';
in
{
  # Link the entire hyprland config directory from the filtered source
  xdg.configFile."hypr" = {
    source = hyprConfigDir;
    recursive = true;
  };

  # Link other necessary configs


  xdg.configFile."wlogout" = {
    source = "${dotsPath}/.config/wlogout";
    recursive = true;
  };
  
  xdg.configFile."matugen" = {
    source = "${dotsPath}/.config/matugen";
    recursive = true;
  };

  xdg.configFile."quickshell" = {
    source = quickshellConfigDir;
    recursive = true;
  };
}
