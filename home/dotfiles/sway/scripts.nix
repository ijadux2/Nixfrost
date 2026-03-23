{ pkgs, ... }:

let
  # --- Appearance Variables ---
  # Sharing these makes it easy to update your theme in one place
  fuzzelAppearance = ''
    --font="JetBrains Mono:size=10" \
    --background-color=1e1e2eff \
    --text-color=cdd6f4ff \
    --selection-color=cba6f7ff \
    --selection-text-color=1e1e2eff \
    --border-color=cba6f7ff \
    --border-radius=8 \
    --border-width=2 \
    --width=50 \
    --anchor=center \
  '';

  fuzzel-clipboard = pkgs.writeShellApplication {
    name = "fuzzel-clipboard";
    runtimeInputs = with pkgs; [
      cliphist
      fuzzel
      wl-clipboard
    ];
    text = ''
      cliphist list | fuzzel --dmenu --prompt="Clipboard: " ${fuzzelAppearance} --lines=15 | cliphist decode | wl-copy
    '';
  };

  fuzzel-launcher = pkgs.writeShellApplication {
    name = "fuzzel-launcher";
    runtimeInputs = [ pkgs.fuzzel ];
    text = ''
      fuzzel --prompt="Launch: " ${fuzzelAppearance} --lines=10
    '';
  };

  fuzzel-power = pkgs.writeShellApplication {
    name = "fuzzel-power";
    runtimeInputs = with pkgs; [
      fuzzel
      systemd
    ];
    text = ''
      actions="Shutdown\nReboot\nLogout\nSuspend\nHibernate\nLock"
      selected=$(echo -e "$actions" | fuzzel --dmenu --prompt="Power: " ${fuzzelAppearance} --lines=6 --selection-color=f38ba8ff --border-color=f38ba8ff)

      case "$selected" in
        "Shutdown") systemctl poweroff ;;
        "Reboot") systemctl reboot ;;
        "Logout") loginctl terminate-user "$USER" ;; # More universal than pkill
        "Suspend") systemctl suspend ;;
        "Hibernate") systemctl hibernate ;;
        "Lock") hyprlock || swaylock ;; 
      esac
    '';
  };

  screen-shot = pkgs.writeShellApplication {
    name = "screen-shot";
    runtimeInputs = with pkgs; [
      fuzzel
      grim
      slurp
      wl-clipboard
      libnotify
      jq
    ];
    text = ''
      TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
      SAVE_DIR="$HOME/Pictures/Screenshots"
      mkdir -p "$SAVE_DIR"

      actions="Full Screen\nActive Window\nSelection\nCopy to Clipboard"
      selected=$(echo -e "$actions" | fuzzel --dmenu --prompt="Screenshot: " ${fuzzelAppearance} --lines=4 --selection-color=89b4faff --border-color=89b4faff)

      case "$selected" in
        "Full Screen")
          grim "$SAVE_DIR/screenshot_$TIMESTAMP.png"
          notify-send "Screenshot" "Saved to $SAVE_DIR"
          ;;
        "Active Window")
          # Detect if we are on Hyprland or Sway for geometry
          if [ -n "''${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
            GEOM=$(hyprctl activewindow -j | jq -r '.at | "\(.[0]),\(.[1]) \(.[2])x\(.[3])"')
          else
            GEOM=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
          fi
          grim -g "$GEOM" "$SAVE_DIR/screenshot_$TIMESTAMP.png"
          notify-send "Screenshot" "Active window saved"
          ;;
        "Selection")
          grim -g "$(slurp)" "$SAVE_DIR/screenshot_$TIMESTAMP.png"
          notify-send "Screenshot" "Selection saved"
          ;;
        "Copy to Clipboard")
          grim -g "$(slurp)" - | wl-copy
          notify-send "Screenshot" "Copied to clipboard"
          ;;
      esac
    '';
  };

  status-bar = pkgs.writeShellApplication {
    name = "status-bar";
    runtimeInputs = with pkgs; [
      pulseaudio
      networkmanager
      coreutils
      gnugrep
      gawk
    ];
    text = ''
      while true; do
        # Volume
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -1 || echo "0")
        mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}' || echo "yes")
        vol_str=$([ "$mute" = "yes" ] && echo "MUTED" || echo "''${vol}%")

        # Battery
        bat_path="/sys/class/power_supply/BAT0"
        if [ -d "$bat_path" ]; then
          bat=$(cat "$bat_path/capacity")
          status=$(cat "$bat_path/status")
          bat_str="''${bat}%$([ "$status" = "Charging" ] && echo "+" || echo "")"
        else
          bat_str="AC"
        fi

        # Network
        net_str=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2 || echo "Disconnected")

        echo "VOL:''${vol_str} | BAT:''${bat_str} | NET:''${net_str} | $(date +'%Y-%m-%d %I:%M %p')"
        sleep 1
      done
    '';
  };

  wallpaper-selector = pkgs.writeShellApplication {
    name = "wallpaper-selector";
    runtimeInputs = with pkgs; [
      swww
      fuzzel
      libnotify
      findutils
    ];
    text = ''
      WALL_DIR="$HOME/Pictures/wallpapers"
      [ ! -d "$WALL_DIR" ] && notify-send "Error" "Wallpaper directory not found" && exit 1

      # Start swww if not running
      pgrep -x swww-daemon >/dev/null || swww-daemon &

      cd "$WALL_DIR"
      SELECTED=$(find . -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) -printf "%P\n" | fuzzel --dmenu --prompt="󰸉 Select: " ${fuzzelAppearance})

      if [ -n "$SELECTED" ]; then
        swww img "$SELECTED" --transition-type grow --transition-pos 0.5,0.5
        notify-send "󰸉 Wallpaper changed" "Set to: $SELECTED"
        echo "$WALL_DIR/$SELECTED" > "$HOME/.current_wallpaper"
      fi
    '';
  };

in
{
  home.packages = [
    fuzzel-clipboard
    fuzzel-launcher
    fuzzel-power
    screen-shot
    status-bar
    wallpaper-selector
  ];
}
