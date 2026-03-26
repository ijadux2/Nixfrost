{ ... }:

{

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      cm = "cmatrix";
      update = "home-manager switch";
      clean = "sudo nix-collect-garbage -d";
      v = "nvim";
      bt = "btop --force-utf";
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
      gcl = "git clone";
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
      setopt autocd
      export LUA_SOCKET_PATH=/nix/store/7qd5w3pcl6gch38qs8f9ff80prxwi2vd-lua5.2-luasocket-3.1.0-1/share
      fastfetch
    '';
  };
}
