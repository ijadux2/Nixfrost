{ ... }:

let
  # Import the colors we just defined
  mocha = import ./mocha.nix;
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "network"
          "pulseaudio"
          "battery"
          "clock"
        ];

        "clock" = {
          format = "<span size='12000' foreground='#f5c2e7'></span>{:%I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "<span size='18000' foreground='#a6e3a1'>{icon} </span> {capacity}%";
          format-warning = "<span size='18000' foreground='#B1E3AD'>{icon} </span> {capacity}%";
          format-critical = "<span size='18000' foreground='#E38C8F'>{icon} </span> {capacity}%";
          format-charging = "<span size='18000' foreground='#B1E3AD'></span>{capacity}%";
          format-plugged = "<span size='18000' foreground='#B1E3AD'></span>{capacity}%";
          format-alt = "<span size='18000' foreground='#B1E3AD'>{icon} </span> {time}";
          format-full = "<span size='18000' foreground='#B1E3AD'></span>{capacity}%";
          tooltip-format = "{time}";
        };

        "network" = {
          format-wifi = "<span size='18000' foreground='#f5e0dc'></span>{essid}";
          format-ethernet = "<span size='18000' foreground='#f5e0dc'></span> Disconnected";
          format-disconnected = "<span size='18000' foreground='#f5e0dc'></span>Disconnected";
          tooltip-format-wifi = "Signal Strenght: {signalStrength}%";
        };

        "pulseaudio" = {
          format = "<span size='16000'>{icon}</span>{volume}%";
          format-muted = " ";
          on-click = "pavucontrol";
        };
      }
    ];

    style = mocha.colors + ''
      * {
        font-family: "JetBrains Mono NL", "JetBrains Mono", monospace;
        font-size: 14px;
        min-height: 0;
        font-weight: bold;
      }

      window#waybar {
        background: transparent;
        background-color: @crust;
        color: @overlay0;
        transition-property: background-color;
        transition-duration: 0.1s;
        border-bottom: 1px solid @overlay1;
      }

      #window {
        margin: 8px;
        padding-left: 8px;
        padding-right: 8px;
      }

      #workspaces button {
        padding: 0 4px;
      }

      #workspaces button.active {
        background-color: rgba(0, 0, 0, 0.3);
        color: @mauve;
        border-top: 2px solid @mauve;
      }

      #clock { color: @maroon; border-bottom: 2px solid @maroon; }
      #pulseaudio { color: @blue; border-bottom: 2px solid @blue; }
      #network { color: @yellow; border-bottom: 2px solid @yellow; }
      #battery { color: @green; border-bottom: 2px solid @green; }

      #pulseaudio, #clock, #battery, #network {
        margin-top: 2px;
        margin-bottom: 2px;
        margin-left: 4px;
        margin-right: 4px;
        padding-left: 4px;
        padding-right: 4px;
      }
    '';
  };
}
