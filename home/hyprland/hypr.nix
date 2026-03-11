{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # 1. FIX: Use an absolute path or a Nix-path relative to this file.
    # If mocha.conf is in the same folder as this nix file, use ./mocha.conf
    extraConfig = ''
      ${builtins.readFile ./mocha.conf}
    '';

    settings = {
      # --- Initialization ---
      exec-once = [
        "swww-daemon"
        "swww img /home/jadu/Pictures/wallpapers/tree.jpg --transition-type grow --transition-fps 60 --transition-pos 0.5,0.5 --transition-duration 2"
        "swaync"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hyprctl setcursor TAR-21 22"
      ];

      # --- Variables ---
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "thunar";

      monitor = ",preferred,auto,1";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # --- Look and Feel ---
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 0.9;
        inactive_opacity = 0.85;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 4;
          passes = 3;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1"
          "quick, 0.15, 0, 0.1, 1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor, 1, 7, quick"
        ];
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = false;
      };

      # --- Keybindings ---
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, C, exec, $terminal nvim"
        "$mainMod, Q, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, SPACE, togglefloating"
        "$mainMod, L, exec, lock"
        "$mainMod SHIFT, N, exec, swaync-client -t -rs"
        "$mainMod, B, exec, chromium"
        "$mainMod, TAB, workspace, previous"
        "$mainMod, T, exec, blueman-manager"

        # Scripts (Using absolute paths is safer in Nix unless you use builtins.path)
        "$mainMod, D, exec, fuzzel-launcher"
        "$mainMod, W, exec, wallpaper-selector "
        "$mainMod, V, exec, fuzzel-clipboard"
        "$mainMod, F, exec, screen-shot"
        "$mainMod, P, exec, fuzzel-power"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
            key = if ws == 10 then "0" else toString ws;
          in
          [
            "$mainMod, ${key}, workspace, ${toString ws}"
            "$mainMod SHIFT, ${key}, movetoworkspace, ${toString ws}"
          ]
        ) 10
      ));

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # 2. FIX: bindel (locked and repeat) for volume keys
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

    };
  };
}
