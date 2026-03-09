{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    imports = [
      ./utils/lsp.nix
      ./utils/keybinds.nix
      ./utils/treesitter.nix
      ./utils/cmp.nix
      ./utils/plugins.nix
    ];

    colourscheme.catppuccin.enable = true;

    clipboard = {
      providers.wl-copy.enable = pkgs.stdenv.isLinux;
    };

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      breakindent = true;
      cursorline = true;
      scrolloff = 8;
      mouse = "a";
      foldmethod = "manual";
      foldenable = false;
      linebreak = true;
      spell = false;
      swapfile = false;
      timeoutlen = 300;
      termguicolors = true;
      showmode = false;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      cmdheight = 0;
      clipboard = "unnamedplus";
      shiftwidth = 2; # Indentation
      tabstop = 2;
      expandtab = true; # Use spaces instead of tabs
      smartindent = true;
      undofile = true;
    };

  };
}
