{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # Communication
    telegram-desktop
    vesktop
    whatsapp-electron
    gnome-boxes

    # CLI Tools
    git
    curl
    wget
    fzf
    ripgrep
    eza
    bat
    zoxide
    yt-dlp
    fastfetch
    nitch
    cmatrix
    glow
    gum
    file
    libnotify

    # Shells & Prompt
    starship
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting

    # File Managers
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    thunar-vcs-plugin

    # System Utilities
    brightnessctl
    cliphist
    direnv

    # Visual
    btop

    # Desktop/WM
    swaynotificationcenter
  ];

}
