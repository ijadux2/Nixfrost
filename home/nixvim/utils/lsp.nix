{ ... }:

{
  lsp = {
    enable = true;
    server = {
      nil_ls.enable = true;
      pyright.enable = true;
      clangd.enable = true;
      zls.enable = true;
      lua_ls.enable = true;
      html.enable = true;
      markdown_oxide.enable = true;
      cssls.enable = true;
      bashls.enable = true;
    };
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 500;
        };
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          python = [ "black" ];
          lua = [ "stylua" ];
          cpp = [ "clang-format" ];
          bash = [ "shfmt" ];
        };
      };
    };

    # 3. Linting (nvim-lint)
    lint = {
      enable = true;
      lintersByFt = {
        nix = [ "statix" ];
        bash = [ "shellcheck" ];
        python = [ "ruff" ];
      };
    };
  };
}
