# Workspace configuration
{ config, pkgs, lib, hostVars, ... }:

{
  # Workspaces: Use the user's workspace config
  xdg.configFile."hypr/workspaces.conf".text = lib.mkForce ''
    workspace = 1, monitor:${hostVars.port_name}, default:true
    workspace = 2, monitor:${hostVars.secondary_monitor}, default:true
  '';
}
