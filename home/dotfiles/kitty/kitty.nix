{ ... }:

let
  kittyTheme = import ./theme.nix;
in

{
  programs.kitty = {
    enable = true;

    # Fonts
    font = {
      name = "Iosevka Nerd Font";
      size = 16;
    };

    # Theme - Using the built-in Catppuccin-Mocha support in Home Manager
    themeFile = "Catppuccin-Mocha";

    shellIntegration.enableZshIntegration = false;

    # Detailed Settings
    settings = kittyTheme.settings // {
      # Cursor Configuration
      cursor_shape = "block";
      cursor_blink_interval = "1.5";
      cursor_stop_blinking_after = "15.0";
      cursor_trail = 10;
      cursor_trail_delay = "0.1";
      cursor_beam_thickness = "0.25";

      # Performance & Window
      gpu = "True";
      confirm_os_window_close = 0;
      window_margin_width = 6;
      draw_minimal_borders = "yes";
      background_opacity = "0.9";
      dynamic_background_opacity = "yes";
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";
      resize_in_steps = "yes";
      linux_display_server = "auto";

      # Tab Bar
      tab_bar_min_tabs = 1;
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      tab_bar_edge = "top";
      tab_title_template = "{index}: {title}";
      active_tab_title_template = "  {index}: {title}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";

      # Scrollback
      scrollback_lines = 20000;
      scrollback_pager_history_size = 1000;
      scrollback_fill_enlarged_gap = "no";

      # Mouse & URLs
      mouse_hide_when_typing = "yes";
      focus_follows_mouse = "yes";
      pointer_shape_when_grabbed = "arrow";
      url_prefixes = "http https file ftp ftps git ssh";
      detect_urls = "yes";
      url_style = "curly";

      # Advanced / Remote Control
      shell = "/run/current-system/sw/bin/zsh";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      enable_ligatures = "cursor";

      # Layouts
      enabled_layouts = "tall,fat,grid,stack,splits,horizontal,vertical";
      default_layout = "tall";

      # Window Sizing
      remember_window_size = "yes";
      initial_window_width = "120c";
      initial_window_height = "60c";
    };

    # Key Bindings
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";
      "ctrl+shift+z" = "toggle_audio_bell";

      # Launch Actions
      "super+shift+p" = "launch --allow-remote-control ~/.config/kitty/kitty-command-palete.sh";
      "super+shift+o" = "launch --location=vsplit --cwd=current";
      "super+shift+q" = "close_tab";

      # Tab Management
      "super+shift+enter" = "launch --type=tab --cwd=current";
      "super+shift+i" = "launch --type=tab --cwd=current btop --force-utf";
      "super+shift+v" = "launch --type=tab --cwd=current nvim .";
      "super+shift+y" = "launch --type=tab --cwd=current yazi";
    };
  };
}
