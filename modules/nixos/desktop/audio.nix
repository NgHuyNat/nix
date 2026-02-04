{ config, pkgs, unstable, ... }:

{
  # === MINIMAL AUDIO CONFIGURATION - NixOS 25.11 Default ===
  
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
    
    # Echo cancellation and noise suppression module
    extraConfig.pipewire."99-echo-cancel" = {
      "context.modules" = [
        {
          name = "libpipewire-module-echo-cancel";
          args = {
            # Use WebRTC DSP for echo cancellation
            "library.name" = "aec/libspa-aec-webrtc";
            "node.name" = "Echo Cancellation Mic";
            "node.description" = "Echo Cancellation Microphone";
            "audio.rate" = 48000;
            "audio.channels" = 1;
            "source.props" = {
              "node.name" = "echo-cancel-source";
              "node.description" = "Echo Cancelled Mic";
            };
            "sink.props" = {
              "node.name" = "echo-cancel-sink";
              "node.description" = "Echo Cancel Sink";
            };
            "aec.args" = {
              "webrtc.gain_control" = true;
              "webrtc.extended_filter" = true;
              "webrtc.delay_agnostic" = true;
              "webrtc.high_pass_filter" = true;
              "webrtc.noise_suppression" = true;
              "webrtc.transient_suppression" = true;
            };
          };
        }
      ];
    };
    
    wireplumber.configPackages = [
      (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/99-disable-routes.conf" ''
        wireplumber.profiles = {
          main = {
            state-routes.lua = disabled
          }
        }
      '')
    ];
  };

  security.rtkit.enable = true;
  hardware.firmware = [ pkgs.sof-firmware ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
    sof-firmware
  ];
} 