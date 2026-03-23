{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./home/modules/time.nix
    ./home/modules/services.nix
    ./home/pkgs/pkgs.nix
    ./home/pkgs/shell.nix
    ./home/virtual/virtual.nix
    ./home/modules/catppuccin.nix
    ./home/modules/distro.nix
  ]
  ++ (
    if builtins.pathExists ./hardware-configuration.nix then [ ./hardware-configuration.nix ] else [ ]
  );
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "itachi";
  nix.settings.auto-optimise-store = true;

  boot.loader.grub = {
    enable = true;
    device = "nodev"; # Required for UEFI
    efiSupport = true;
    useOSProber = false; # Set to true if you dual-boot with Windows
    configurationLimit = 5; # Matches your previous limit
  };

  nix.settings.trusted-users = [
    "root"
    "jadu"
  ];

  # In configuration.nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.jadu = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "jadu";
    extraGroups = [
      "networkmanager"
      "libvirtd"
      "kvm"
      "wheel"
      "podman"
      "video"
      "render"
    ];
  };
  security.sudo.extraConfig = "Defaults pwfeedback";
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    openssl
    libXcomposite
    libXtst
    libXrandr
    libXext
    libX11
    libXfixes
    libGL
    libva
    pipewire
    libxcb
    libXdamage
    libxshmfence
    libXxf86vm
    libelf

    # Required
    glib
    gtk2
    bzip2

    # Without these it silently fails
    libXinerama
    libXcursor
    libXrender
    libXScrnSaver
    libXi
    libSM
    libICE
    gnome2.GConf
    nspr
    nss
    cups
    libcap
    SDL2
    libusb1
    dbus-glib
    ffmpeg
    # Only libraries are needed from those two
    libudev0-shim

    # Verified games requirements
    libXt
    libXmu
    libogg
    libvorbis
    SDL
    SDL2_image
    glew_1_10
    libidn
    tbb

    # Other things from runtime
    flac
    freeglut
    libjpeg
    libpng
    libpng12
    libsamplerate
    libmikmod
    libtheora
    libtiff
    pixman
    speex
    SDL_image
    SDL_ttf
    SDL_mixer
    SDL2_ttf
    SDL2_mixer
    libappindicator-gtk2
    libdbusmenu-gtk2
    libindicator-gtk2
    libcaca
    libcanberra
    libgcrypt
    libvpx
    librsvg
    libXft
    libvdpau
    pango
    cairo
    atk
    gdk-pixbuf
    fontconfig
    freetype
    dbus
    alsa-lib
    expat
    libdrm
    mesa
    libxkbcommon
  ];

  system.stateVersion = "26.05";
}
