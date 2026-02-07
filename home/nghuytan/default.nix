{ config, pkgs, unstable, inputs, hostVars, ... }:

{
  home.username = hostVars.user.username;             
  home.homeDirectory = "/home/${hostVars.user.username}"; 
  home.stateVersion = hostVars.nix_version;
  
  imports = [
    # Desktop
    # ../../modules/home-manager/desktop/hyprland
    ../../modules/home-manager/desktop/hyprland/end4-adapter.nix
    ../../modules/home-manager/desktop/xdg-portal
    ../../modules/home-manager/features/bat

    # Features
    ../../modules/home-manager/features/quickshell
    ../../modules/home-manager/features/zsh
    ../../modules/home-manager/features/nvim
    ../../modules/home-manager/features/wezterm
    ../../modules/home-manager/features/kitty
    ../../modules/home-manager/features/tmux
    ../../modules/home-manager/features/git
    ../../modules/home-manager/features/mpv
    ../../modules/home-manager/features/dolphin
    ../../modules/home-manager/features/fastfetch
    ../../modules/home-manager/features/ripgrep
    ../../modules/home-manager/features/noisetorch
    ../../modules/home-manager/features/starship
    
    # GUI
    ../../modules/home-manager/gui/cursor
    ../../modules/home-manager/gui/fontconfig
    ../../modules/home-manager/gui/gtk-theme
    ../../modules/home-manager/gui/kde
    ../../modules/home-manager/gui/kvantum
    ../../modules/home-manager/gui/matugen
    ../../modules/home-manager/gui/qt5ct
    ../../modules/home-manager/gui/qt6ct       
  ];

  programs.direnv = {
    enable = true;
  };  

  programs.git = {
    settings = {
      user = {
        name = hostVars.git_name;                
        email = hostVars.git_email;
      };
    };
  };

  home.packages = with pkgs; [
    unstable.google-chrome
    unstable.firefox                  
    unstable.discord                  
    unstable.spotify                  
    unstable.vscode                    
    unstable.antigravity               
    unstable.telegram-desktop         
    unstable.slack                    
    unstable.obsidian                  
    unstable.obs-studio                
    (prismlauncher.override {
      jdks = [
        jdk
        jdk17
      ];
    })
  ];

  home.shellAliases = hostVars.alias;
  services.syncthing = hostVars.syncthing;

  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    cache=${config.home.homeDirectory}/.npm-cache
    init-author-name=${hostVars.user.name}
    init-author-email=${hostVars.user.email}
    init-license=MIT
    save-exact=true
    package-lock=true
  '';

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "${config.home.homeDirectory}/Documents";
    pictures = "${config.home.homeDirectory}/Pictures";
    
    extraConfig = {
      XDG_DOWNLOAD_DIR = "${config.home.homeDirectory}/Downloads";
      XDG_WORKSPACES_DIR = "${config.home.homeDirectory}/Workspaces";
    };
  };

  home.sessionVariables = {
    DOWNLOAD_DIR = "${config.home.homeDirectory}/Downloads";
    DOCUMENTS_DIR = "${config.home.homeDirectory}/Documents";
  };

  # === CẤU HÌNH SSH MỚI ===
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes"; # Tự động thêm key vào agent để không phải nhập lại pass
    
    matchBlocks = {
      # GitHub
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_github";
        identitiesOnly = true;
      };

      # GitLab
      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_gitlab";
        identitiesOnly = true;
      };

      # GitLab AISoft
      "gitlab.aisoftech.vn" = {
        hostname = "gitlab.aisoftech.vn";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_gitlab_aisoft";
        identitiesOnly = true;
      };

      # GitLab RIPT
      "gitlab.ript.vn" = {
        hostname = "gitlab.ript.vn";
        user = "git";
        port = 11024;
        identityFile = "~/.ssh/id_ed25519_gitlab_ript";
        identitiesOnly = true;
      };

      # GitLab Nooblearn2code
      "gitlab.nooblearn2code.com" = {
        hostname = "14.225.218.83";
        user = "git";
        port = 222;
        identityFile = "~/.ssh/id_ed25519_gitlab_nooblearn2code";
        identitiesOnly = true;
      };
    };
  };
}