{
  ...
}:

{
  # home-manager modules and files
  imports = [
    ./dotfiles/kitty/kitty.nix
    ./dotfiles/foot/foot.nix
    ./dotfiles/sway/config.nix
    ./dotfiles/sway/scripts.nix
    ./dotfiles/shell/zsh.nix
    ./dotfiles/swaync/config.nix
    ./dotfiles/waybar/config.nix
    ./dotfiles/hyprland/hypr.nix
    ./dotfiles/hyprland/hyprlock.nix
    ./dotfiles/starship/starship.nix
    ./modules/scripts.nix
    ./pkgs/jadu-pkgs.nix
    ./stylix/catppuccin.nix
  ]
  ++ (if builtins.pathExists ./modules/ssh.nix then [ ./modules/ssh.nix ] else [ ]);

  home.username = "jadu";
  home.homeDirectory = "/home/jadu";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;

  #  home.file = builtins.listToAttrs (
  #    map (name: {
  #      name = ".config/${name}";
  #      value = {
  #        source = ./dotfiles/${name};
  #      };
  #    }) dotfiles
  #  );

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "kv26102009@gmail.com";
        name = "Kumar vaibhav";
      };
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
      };

      # Useful aliases
      aliases = {
        st = "status";
        co = "checkout";
        br = "branch";
        lg = "log --graph --oneline --all";
      };
    };
  };
  programs.delta = {
    enable = true;
    options = {
      side-by-side = true;
      line-numbers = true;
      enableGitIntegration = true;
    };
  };
}
