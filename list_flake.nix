{ pkgs ? import <nixpkgs> {} }:
let
  flake = builtins.getFlake (toString ./.);
  end4dots = flake.inputs.end-4-dots;
in
  pkgs.writeShellScriptBin "list-end4" ''
cat ${end4dots.outPath}/sdata/dist-nix/home-manager/quickshell.nix
''
