# ███╗   ██╗██╗    ██╗ ██████╗       ██████╗ ██╗███████╗██████╗ ██╗      █████╗ ██╗   ██╗███████╗
# ████╗  ██║██║    ██║██╔════╝       ██╔══██╗██║██╔════╝██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝
# ██╔██╗ ██║██║ █╗ ██║██║  ███╗█████╗██║  ██║██║███████╗██████╔╝██║     ███████║ ╚████╔╝ ███████╗
# ██║╚██╗██║██║███╗██║██║   ██║╚════╝██║  ██║██║╚════██║██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ╚════██║
# ██║ ╚████║╚███╔███╔╝╚██████╔╝      ██████╔╝██║███████║██║     ███████╗██║  ██║   ██║   ███████║
# ╚═╝  ╚═══╝ ╚══╝╚══╝  ╚═════╝       ╚═════╝ ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
# ---------------------------------------------------------------------------------------------
# NWG-DISPLAYS: GUI để quản lý và cấu hình monitor cho Hyprland
# nwg-displays sẽ ghi config vào ~/.config/hypr/monitors.conf
# Hyprland sẽ source file này để áp dụng cấu hình

{ config, lib, pkgs, ... }:

let
  # File config mà nwg-displays sẽ ghi vào (mutable)
  monitorsConf = "${config.home.homeDirectory}/.config/hypr/monitors.conf";
in
{
  home.packages = with pkgs; [
    nwg-displays  # GUI quản lý monitor
    wlr-randr     # Dependency để detect monitors
  ];

  # Tạo file monitors.conf nếu chưa tồn tại
  # File này KHÔNG phải symlink, nwg-displays có thể ghi đè
  home.activation.createMonitorsConf = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -f "${monitorsConf}" ]; then
      mkdir -p "$(dirname "${monitorsConf}")"
      cat > "${monitorsConf}" << 'EOF'
# Cấu hình monitor - được quản lý bởi nwg-displays
# Sử dụng nwg-displays để chỉnh sửa file này

# Cấu hình mặc định
monitor = eDP-2, 1920x1080@144.00, 0x0, 1
monitor = DP-1, 1920x1080@143.99, 1920x0, 1
EOF
    fi
  '';

  # Source file monitors.conf trong Hyprland
  wayland.windowManager.hyprland.extraConfig = ''
    # === NWG-DISPLAYS MONITOR CONFIG ===
    source = ~/.config/hypr/monitors.conf
  '';
}
