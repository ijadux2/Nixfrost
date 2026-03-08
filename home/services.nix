{
  pkgs,
  inputs,
  ...
}:

{
  services.displayManager.ly.enable = true;
  services.xserver.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  programs.ssh.startAgent = true;

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    nix-ld.enable = true;
    thunar.enable = true;
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.zed-mono
    fira-code
    noto-fonts
    # Creating a native Nix package from the flake input
    (pkgs.runCommand "jetbrains-nerd" { } ''
      install -Dm644 ${inputs.kitty-fonts} $out/share/fonts/truetype/JetBrainsMonoNerdFont-Regular.ttf
    '')
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
    };

  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    libinput.enable = true;
    blueman.enable = true;
    flatpak.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  # Enable networking for Noctalia
  networking.networkmanager.enable = true;

}
