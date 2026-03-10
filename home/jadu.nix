{
  ...
}:

{
  # home-manager modules and files
  imports = [
    ./kitty/kitty.nix
    ./hyprland/hypr.nix
    ./waybar/config.nix
    ./sway/config.nix
    ./sway/scripts.nix
    ./foot/foot.nix
    ./swaync/config.nix
    ./starship/starship.nix
    ./pkgs/jadu-pkgs.nix
    ./shell/zsh.nix
    ./shell/bash.nix
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
