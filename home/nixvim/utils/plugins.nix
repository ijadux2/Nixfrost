{ ... }:

{
  plugins = {
    imports = [
      ./plugins/indent.nix
      ./plugins/noice.nix
      ./plugins/nvim-tree.nix
      ./plugins/telescope.nix
      ./plugins/term.nix
    ];

    auto-save.enable = true;
    cloak.enable = true;
    colorizer.enable = true;
    highlight-colors.enable = true;
    image.enable = true;
    lualine.enable = true;
    markdown-preview.enable = true;
    mini.mockDevIcons = true;
    notify.enable = true;
    nui.enable = true;
    nvim-autopairs.enable = true;
    render-markdown.enable = true;
    which-key.enable = true;
    trouble.enable = true;
    yazi.enable = true;

  };
}
