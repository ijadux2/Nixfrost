{ ... }:

let
  # Defining the Catppuccin Mocha colors used in your config
  # You can also import these from a separate palette file
  palette = {
    base = "rgb(1e1e2e)";
    text = "rgb(cdd6f4)";
    textAlpha = "cdd6f4";
    mauve = "rgb(cba6f7)";
    mauveAlpha = "cba6f7";
    red = "rgb(f38ba8)";
    yellow = "rgb(f9e2af)";
    surface0 = "rgb(313244)";
  };
  font = "JetBrainsMono Nerd Font";
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "$HOME/Pictures/wallpapers/cat_leaves.png"; # Ensure this path exists
          color = palette.base;
          blur_passes = 0;
        }
      ];

      label = [
        # LAYOUT
        {
          monitor = "";
          text = "Layout: $LAYOUT";
          color = palette.text;
          font_size = 25;
          font_family = font;
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
        # TIME
        {
          monitor = "";
          text = "$TIME";
          color = palette.text;
          font_size = 90;
          font_family = font;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        # DATE
        {
          monitor = "";
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          color = palette.text;
          font_size = 25;
          font_family = font;
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
        # FINGERPRINT
        {
          monitor = "";
          text = "$FPRINTPROMPT";
          color = palette.text;
          font_size = 14;
          font_family = font;
          position = "0, -107";
          halign = "center";
          valign = "center";
        }
      ];

      image = [
        {
          monitor = "";
          path = "$HOME/.madara.jpeg";
          size = 100;
          border_color = palette.mauve;
          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = palette.mauve;
          inner_color = palette.surface0;
          font_color = palette.text;
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##${palette.textAlpha}"><i>󰌾 Logged in as </i><span foreground="##${palette.mauveAlpha}">$USER</span></span>'';
          hide_input = false;
          check_color = palette.mauve;
          fail_color = palette.red;
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = palette.yellow;
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
