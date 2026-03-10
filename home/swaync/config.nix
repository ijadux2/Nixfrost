{ ... }:

{
  services.swaync = {
    enable = true;

    # JSON Settings
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      cssPriority = "user";
      control-center-layer = "top";
      layer-shell = true;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 6;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 400;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;

      widgets = [
        "title"
        "dnd"
        "notifications"
        "volume"
        "backlight"
        "mpris"
        "buttons-grid"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
        buttons-grid = {
          actions = [
            {
              label = "Power Off";
              command = "systemctl poweroff";
              type = "toggle";
            }
            {
              label = "Reboot";
              command = "systemctl reboot";
              type = "toggle";
            }
            {
              label = "Lock";
              command = "hyprlock";
              type = "toggle";
            }
            {
              label = "Logout";
              command = "hyprctl dispatch exit";
              type = "toggle";
            }
          ];
        };
      };
    };

    # CSS Stylesheet
    style = ''
      @define-color noti-bg rgba(30, 30, 46, 0.9);
      @define-color noti-bg-alt rgba(24, 24, 37, 0.9);
      @define-color noti-border rgba(180, 190, 254, 0.8);
      @define-color noti-bg-hover rgba(49, 50, 68, 0.9);
      @define-color noti-bg-focus rgba(49, 50, 68, 0.9);
      @define-color noti-close-bg rgba(243, 139, 168, 0.8);
      @define-color noti-close-bg-hover rgba(243, 139, 168, 1.0);
      @define-color text-color rgba(205, 214, 244, 1.0);
      @define-color text-color-disabled rgba(127, 132, 156, 1.0);
      @define-color bg-selected rgba(137, 180, 250, 0.8);

      * {
        font-family: "JetBrains Mono Nerd Font", monospace;
        font-size: 14px;
      }

      .notification-row { outline: none; }
      .notification-row:focus, .notification-row:hover { background: @noti-bg-hover; }

      .notification-background {
        background: @noti-bg;
        border: 1px solid @noti-border;
        border-radius: 12px;
        margin: 6px;
        padding: 12px;
      }

      .notification-close-button {
        background: @noti-close-bg;
        border: none;
        border-radius: 6px;
        color: @text-color;
        margin: 4px;
        padding: 4px;
      }

      .notification-close-button:hover { background: @noti-close-bg-hover; }
      .notification-content { background: transparent; border-radius: 12px; padding: 6px; }
      .notification-title { color: @text-color; font-weight: bold; margin-bottom: 4px; }
      .notification-body { color: @text-color; font-size: 12px; }

      .control-center {
        background: @noti-bg;
        border: 1px solid @noti-border;
        border-radius: 12px;
        padding: 12px;
      }

      .widget-title { color: @text-color; font-weight: bold; margin: 12px 0 6px 0; }
      .widget-dnd { background: @noti-bg-alt; border: 1px solid @noti-border; border-radius: 8px; margin: 6px; padding: 12px; }
      .widget-dnd-toggle { background: @bg-selected; border: none; border-radius: 6px; color: @text-color; padding: 6px 12px; }

      .widget-mpris, .widget-buttons-grid, .widget-volume, .widget-backlight {
        background: @noti-bg-alt;
        border: 1px solid @noti-border;
        border-radius: 8px;
        margin: 6px;
        padding: 12px;
      }

      .widget-buttons-grid button {
        background: @bg-selected;
        border: none;
        border-radius: 6px;
        color: @text-color;
        margin: 4px;
        padding: 8px 12px;
      }

      .widget-buttons-grid button:hover { background: @noti-bg-hover; }
      .top-bar-title { color: @text-color; font-weight: bold; }
    '';
  };
}
