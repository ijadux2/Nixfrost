{
  treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;

      ensure_installed = [
        "lua"
        "nix"
        "python"
        "javascript"
        "typescript"
        "json"
        "bash"
        "markdown"
      ];
    };
  };
}
