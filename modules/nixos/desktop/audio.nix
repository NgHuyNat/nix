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
              # Echo cancellation
              "webrtc.extended_filter" = true;
              "webrtc.delay_agnostic" = true;
              
              # Noise suppression - level 0-3, higher = more aggressive
              "webrtc.noise_suppression" = true;
              "webrtc.noise_suppression_level" = 3;  # Very High
              
              # Transient suppression (keyboard/mouse clicks)
              "webrtc.transient_suppression" = true;
              
              # High pass filter (removes low frequency rumble)
              "webrtc.high_pass_filter" = true;
              
              # Gain control
              "webrtc.gain_control" = true;
              "webrtc.analog_gain_control" = false;
              "webrtc.digital_gain_control" = true;
              
              # Voice activity detection
              "webrtc.voice_detection" = true;
              
              # Experimental features
              "webrtc.experimental_agc" = true;
              "webrtc.experimental_ns" = true;
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
  programs.noisetorch.enable = true;  # Better than built-in WebRTC for noise/keyboard suppression
  hardware.firmware = [ pkgs.sof-firmware ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
    sof-firmware
  ];

} 