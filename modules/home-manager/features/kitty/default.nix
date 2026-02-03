{ config, lib, hostVars, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "Google Sans Code";
      size = 13.0;
    };
    
    settings = {
      # Remote control for theme reloading
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty-socket";
      
      # Cursor settings
      cursor_shape = "beam";
      cursor_trail = 1;
      

      # Font settings
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Window settings - Transparent background
      background_opacity = "0.7";
      background_blur = 30;
      background_image = "none";
      background_tint = "0.8";
      confirm_os_window_close = 0;
      window_padding_width = 10;
      window_margin_width = 10;

      # Tab Bar Aesthetics
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
      tab_bar_margin_width = 5.0;


      # Display server
      linux_display_server = "auto";

      # Scrolling
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;

      # Audio
      enable_audio_bell = false;

      # Additional transparency settings
      dynamic_background_opacity = true;
      background_image_layout = "scaled";

    };

    extraConfig = ''
      # Import color scheme
      include /home/${hostVars.user.username}/Workspaces/Config/nixos/generated/kitty.conf

      # Copy
      map ctrl+c    copy_or_interrupt

      # Search
      map ctrl+f   launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id
      map kitty_mod+f   launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id

      # Scroll & Zoom
      map page_up    scroll_page_up
      map page_down    scroll_page_down

      map ctrl+plus  change_font_size all +1
      map ctrl+equal  change_font_size all +1
      map ctrl+kp_add  change_font_size all +1
      map ctrl+minus       change_font_size all -1
      map ctrl+underscore       change_font_size all -1
      map ctrl+kp_subtract       change_font_size all -1
      map ctrl+0 change_font_size all 0
      map ctrl+kp_0 change_font_size all 0
    '';
  };
}