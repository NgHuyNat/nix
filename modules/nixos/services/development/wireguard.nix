{ config, pkgs, hostVars, ... }:

let
  wgConfigDir = "/home/${hostVars.user.username}/.config/wireguard";
in
{
  environment.systemPackages = [ pkgs.wireguard-tools ];

  systemd.tmpfiles.rules = [
    "L+ /etc/wireguard - - - - ${wgConfigDir}"
  ];
}