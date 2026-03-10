{
  pkgs,
  inputs,
  ...
}:

{
  services.displayManager.ly.enable = true;
  services.xserver.enable = true;
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

  system.autoUpgrade = {
    enable = true;
    flake = "/home/jadu/codespace/Nixfrost/"; # Path to your flake directory
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file" # Optional: automatically commits the new lock file if it's a git repo
    ];
    dates = "02:00";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
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

  networking.networkmanager.enable = true;

}
