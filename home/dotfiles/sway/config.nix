{ pkgs, lib, ... }:

let
  theme = {
    rosewater = "#f5e0dc";
    mauve = "#cba6f7";
    red = "#f38ba8";
    blue = "#89b4fa";
    lavender = "#b4befe";
    text = "#cdd6f4";
    surface0 = "#313244";
    base = "#1e1e2e";
    mantle = "#181825";
    crust = "#11111b";
    overlay1 = "#7f849c";
  };
in
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;

    config = {
      modifier = "Mod4";
      terminal = "kitty";

      gaps = {
        inner = 5;
        outer = 5;
      };
      bars = [ ];

      startup = [
        { command = "wl-paste --type text --watch cliphist store"; }
        { command = "wl-paste --type image --watch cliphist store"; }
        { command = "autotiling"; }
        { command = "swaync"; }
        {
          command = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway";
        }
      ];

      output."*".bg = "/home/jadu/Pictures/wallpapers/cat_leaves.png fill";

      keybindings =
        let
          mod = "Mod4";
        in
        lib.mkOptionDefault {
          "${mod}+Return" = "exec kitty";
          "${mod}+c" = "exec kitty nvim";
          "${mod}+b" = "exec chromium";
          "${mod}+e" = "exec thunar";
          "${mod}+q" = "kill";
          "${mod}+Shift+r" = "reload";
          "${mod}+Shift+n" = "exec swaync-client -t -rs";
          "${mod}+l" = "exec hyprlock";
          "${mod}+tab" = "workspace back_and_forth";
          "${mod}+space" = "floating toggle";

          "${mod}+d" = "exec ~/.config/sway/scripts/dmenu-launcher.sh";
          "${mod}+p" = "exec ~/.config/sway/scripts/dmenu-power.sh";
          "${mod}+v" = "exec ~/.config/sway/scripts/dmenu-clipboard.sh";
          "${mod}+f" = "exec ~/.config/sway/scripts/screenshot.sh";
          "${mod}+w" = "exec ~/.config/sway/scripts/wallpaper-selector.sh";
        };
    };

    extraConfig = ''
      blur enable
      blur_passes 4
      blur_radius 3
      corner_radius 10
      shadows enable

      default_border none
      default_floating_border none
      hide_edge_borders smart

      bar {
          position top
          height 30
          status_command ~/.config/sway/scripts/status.sh
          font pango:JetBrains Mono Nerd Font Bold 12
          colors {
              statusline ${theme.text}
              background ${theme.mantle}
              separator ${theme.mantle}
              inactive_workspace ${theme.mantle} ${theme.mantle} ${theme.overlay1}
              focused_workspace ${theme.mantle} ${theme.mauve} ${theme.crust}
              urgent_workspace ${theme.mantle} ${theme.red} ${theme.mantle}
          }
      }
    '';
  };
}
