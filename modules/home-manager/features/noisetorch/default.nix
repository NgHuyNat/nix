{ pkgs, ... }:

{
  systemd.user.services.noisetorch-auto = {
    Unit = {
      Description = "NoiseTorch Auto Start";
      After = [ "pipewire.service" ];
      Wants = [ "pipewire.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.noisetorch}/bin/noisetorch -i";
      Restart = "always";
      RestartSec = "3";
    };
  };
}
