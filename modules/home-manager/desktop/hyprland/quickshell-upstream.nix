{ pkgs, end-4-dots, quickshell, ... }:
let
  # Define the package by calling the upstream file directly from the input
  quickshellPackage = pkgs.callPackage "${end-4-dots}/sdata/dist-nix/home-manager/quickshell.nix" {
    inherit quickshell;
  };
in
{
  home.packages = [ quickshellPackage ];
}
