{ ... }:

{
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
