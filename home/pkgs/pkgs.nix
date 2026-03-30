{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # browser
    chromium
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    distrobox
    boxbuddy
    fd
    unzip

    # Desktop & Window Manager
    gnome-keyring
    foot
    kitty
    waybar
    swww
    hyprlock
    hyprpolkitagent
    hyprutils
    fuzzel
    grim
    wl-clipboard
    slurp
    xdg-desktop-portal-hyprland
    nwg-look
    bibata-cursors

    # Editors
    neovim
    vim
    vscodium

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    apple-cursor

    # Media
    ffmpeg_7-full
    hugo
    love

    # File Managers
    yazi

    # System Utilities
    xdg-utils
    wget
    coreutils-full
    libtool
    gcc

    # Bluetooth & Audio
    blueman
    bluez
    pulseaudio

    # X11 Tools
    xdotool

    # Graphics
    mesa
    git-crypt

    # OpenCode
    opencode

    # Lua tooling (for Neovim)
    lua-language-server
    stylua
    luaPackages.luacheck
    luajitPackages.luasocket
  ];
}
