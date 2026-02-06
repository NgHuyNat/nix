{ config, pkgs, ... }:

{
  # === BOOT CONFIGURATION ===
  boot = {
    loader = {
      # Use systemd-boot as the bootloader (modern UEFI bootloader)
      systemd-boot = {
        enable = true;
        
        # Limit number of boot entries shown in menu (saves /boot space)
        configurationLimit = 20;  # Show only 5 most recent configurations
        
        # Allow editing kernel parameters at boot (security consideration)
        editor = false;  # Set to true if you need to edit boot parameters
        
        # Console resolution mode
        consoleMode = "auto";  # Options: "auto", "max", "0", "1", "2"
        
        # Windows boot entry
        # Copy Windows bootloader từ Windows EFI partition sang NixOS EFI
        extraInstallCommands = ''
          # Mount Windows EFI partition nếu chưa mount
          ${pkgs.coreutils}/bin/mkdir -p /boot/windows-efi
          ${pkgs.util-linux}/bin/mount -o ro /dev/disk/by-uuid/5285-290D /boot/windows-efi 2>/dev/null || true
          
          # Copy Windows EFI files nếu tồn tại
          if [ -d /boot/windows-efi/EFI/Microsoft ]; then
            ${pkgs.coreutils}/bin/mkdir -p /boot/EFI/Microsoft
            ${pkgs.coreutils}/bin/cp -r /boot/windows-efi/EFI/Microsoft/Boot /boot/EFI/Microsoft/
          fi
          
          # Unmount
          ${pkgs.util-linux}/bin/umount /boot/windows-efi 2>/dev/null || true
        '';
      };
      
      # Boot menu timeout before selecting default entry
      timeout = 5;  # 5 seconds (set to null for infinite wait)
      
      # EFI system configuration
      efi = {
        canTouchEfiVariables = true;  # Allow writing to EFI variables
        efiSysMountPoint = "/boot";   # EFI partition mount point (or "/boot/efi")
      };
    };
    
    # Kernel boot parameters for better user experience
    kernelParams = [ "quiet" "splash" ];  # Reduce boot messages, show splash screen
    
    # Enable Plymouth for graphical boot splash screen
    plymouth.enable = true;
    
    # Kernel modules configuration
    kernelModules = [ ];          # Additional kernel modules to load
    extraModulePackages = [ ];    # Extra kernel module packages
  };
  
  # === NIX STORE MANAGEMENT AND OPTIMIZATION ===
  nix = {
    # Automatic garbage collection to save disk space
    gc = {
      automatic = true;                    # Enable automatic cleanup
      dates = "weekly";                    # Run weekly cleanup
      options = "--delete-older-than 7d"; # Keep only last week of generations
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; # Enable modern Nix features
      auto-optimise-store = true;          # Automatically deduplicate store paths
    };
  };
  
  # Custom cleanup script for manual maintenance
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "cleanup" ''
      # Remove old system profiles older than 7 days
      sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d
      # Garbage collect unreferenced store paths
      sudo nix store gc
      # Optimize store by hardlinking identical files
      sudo nix store optimise
    '')
  ];
}
