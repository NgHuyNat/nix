rec {
  # NIX
  nix_version = "25.11";
  nix_config = "~/Workspaces/Config/nixos"; # Path to NixOS config

  # SYSTEM
  isa = "x86_64"; # uname -m (lowercase)
  os = "linux"; # uname -s (lowercase)

  # DISPLAY
  port_name = "eDP-1";               # Màn hình chính (Laptop)
  port_name2 = "eDP-2";               # Màn hình chính (Laptop)
  secondary_monitor = "HDMI-A-1";        # Màn hình phụ
  resolution = "1920x1080";         # xrandr | grep " connected" | head -1 | awk '{print $3}' | cut -d '+' -f 1
  frequency = "144.00";                # xrandr | grep -oP '\d+\.\d+(?=[*+ ])' | sort -rn | head -n 1
  
  # ENVIRONMENT
  environments = [
    "GDK_SCALE,1"
    "ELM_SCALE,1"
    "QT_SCALE_FACTOR,1"
    
    # === CURSOR THEME ===
    "XCURSOR_THEME,breeze_cursors"
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_THEME,breeze_cursors"
    "HYPRCURSOR_SIZE,24"

    # ############ Wayland #############
    "ELECTRON_OZONE_PLATFORM_HINT,auto"

    # ############ Themes #############
    "XDG_MENU_PREFIX,plasma-"
    "QT_QPA_PLATFORMTHEME,qt6ct"

    # ######## Virtual envrionment #########
    "ILLOGICAL_IMPULSE_VIRTUAL_ENV, ~/.local/state/quickshell/.venv"
  ];

  # NETWORKING
  hostname = "nixos";
  nameservers = [ "8.8.8.8" "8.8.4.4" ];
  firewall = {
    enable = true;
    tcp_ports = [ 
      22
      80
      443
    ];
    udp_ports = [ ];
    trusted_interfaces = [ "tailscale0" ];
  };
  fallback_dns = [ "1.1.1.1" "1.0.0.1" ];
  tailscale = {
    enable = true;
  };

  # USER
  user = {
    name = "Huy Tan";
    username = "nghuytan";
    description = "Huy Tan";
    email = "nghuytan.ptit@gmail.com";
  };

  # GIT
  git_name = "NgHuyNat";
  git_email = "nghuytan.ptit@gmail.com";

  # ALIAS
  alias = {
    cls = "clear";

    # === SYSTEM MANAGEMENT (Enhanced) ===
    oh = "cd ~/ && echo 'Went back home'";
    nixc = "cd ${nix_config}";
    nix-rebuild = "sudo nixos-rebuild switch --flake ${nix_config} --impure";
    nix-test = "sudo nixos-rebuild test --flake ${nix_config} --impure";
    home-rebuild = "home-manager switch --flake ${nix_config}";
    generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    nix-clean = "sudo nix-collect-garbage -d && sudo nix-collect-garbage -d && nix-store --optimize";
    nix-reset = "sudo systemctl stop nix-daemon && sudo rm -rf /nix/store/* && sudo rm -rf /nix/var/nix/db/* && sudo systemctl start nix-daemon && sudo nixos-rebuild switch --flake ${nix_config} --impure";

    # === CODE EDITOR WORKFLOW (Enhanced) ===
    code = "code";
    idea = "idea-community";

    # === DEVELOPMENT SHORTCUTS ===
    dev = "cd ~/Workspaces/Dev";
    wsp = "cd ~/Workspaces";
    prj = "cd ~/Workspaces/projects";
    ptit = "cd ~/Workspaces/ptit";
    vir = "cd ~/Workspaces/virtual";
    
    # === DOCUMENTATION ===
    docs = "cd ~/Documents";
    down = "cd ~/Downloads";   

    # === VPN-WIREGUARD ===
    wg-up = "sudo wg-quick up";
    wg-down = "sudo wg-quick down";
    wg-status = "sudo wg show";
    wg-list = "sudo wg show all";
    wg-restart = "sudo wg-quick down && sudo wg-quick up";
  };

  # SYNCTHING
  syncthing = {
    enable = false;
    
    settings = {
      gui = {
        address = "127.0.0.1:8384";  
        user = "${user.username}";          
      };

      devices = {
        "nixos-desktop" = { id = "CQA7ZJT-S4HOWZ5-TZLMHEC-B7XGZB4-XWVA7BM-IPR3RPL-SCTFXIA-O6GSHQQ"; };
        "syncthing-server" = { id = "C746FCG-KGT3QXD-ITR65Y5-CNWNSAI-YGLNZNL-TUFTRZF-D4R3M5M-3BRTPQN"; };
      };
      
      folders = {
        "workspaces" = {
          id = "workspaces";
          path = "/home/${user.username}/Workspaces";
          devices = [ "nixos-desktop" "syncthing-server" ];
        };
        "documents" = {
          id = "documents";
          path = "/home/${user.username}/Documents";
          devices = [ "nixos-desktop" "syncthing-server" ];
        };
        "pictures" = {
          id = "pictures";
          path = "/home/${user.username}/Pictures";
          devices = [ "nixos-desktop" "syncthing-server" ];
        };
      };
    };
  };

  cloudflared = {
    enable = false;
  };
}