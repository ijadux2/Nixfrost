{
  ...
}:

let
  dotfiles = [
    "waybar"
    "hypr"
    "sway"
    "swaync"
    "starship.toml"
    "foot"
  ];
in

{
  # home-manager modules and files
  imports = [
    ./jadu-pkgs.nix
    ./kitty/kitty.nix
  ]
  ++ (if builtins.pathExists ./home/ssh.nix then [ ./home/ssh.nix ] else [ ]);

  home.username = "jadu";
  home.homeDirectory = "/home/jadu";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;

  home.file = builtins.listToAttrs (
    map (name: {
      name = ".config/${name}";
      value = {
        source = ./dotfiles/${name};
      };
    }) dotfiles
  );

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

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
        "starship"
      ];
    };
    shellAliases = {
      ll = "ls -l";
      cm = "cmatrix";
      update = "home-manager switch";
      clean = "sudo nix-collect-garbage -d";
      v = "nvim";
      x = "clear";
      q = "exit";
      y = "yazi";
      cd = "z";
      ls = "eza --icons";
      lt = "eza --icons --tree";
      code = "opencode";
      gi = "git add .";
      gc = "git commit -m";
      gs = "git status";
      ch = "chmod +x";
      rm = "rm -rf";
      mk = "mkdir";
      t = "touch";
      open = "xdg-open";
      fa = "fastfetch";
      th = "thunar";
      gp = "git push -u origin main";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(zoxide init zsh)"
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = false;
    shellAliases = {
      ll = "ls -l";
      update = "home-manager switch";
      rebuild = "sudo nixos-rebuild switch --flake /home/jadu/codespace/Nixfrost/#itachi";
      clean = "sudo nix-collect-garbage -d";
      v = "nvim";
      x = "clear";
      q = "exit";
      y = "yazi";
      cd = "z";
      ls = "eza --icons";
      lt = "eza --icons --tree";
      code = "opencode";
      gi = "git add .";
      gc = "git commit -m";
      gs = "git status";
      ch = "chmod +x";
      rm = "rm -rf";
      mk = "mkdir";
      t = "touch";
      open = "xdg-open";
      fa = "fastfetch";
      th = "thunar";
      gp = "git push";
    };
    initExtra = ''
      eval "$(zoxide init bash)"
    '';
  };

}
