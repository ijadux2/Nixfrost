{ ... }:

{
  indent-blankline = {
    enable = true;
    exclude = {
      buftypes = [
        "terminal"
        "quickfix"
      ];
      filetypes = [
        ""
        "checkhealth"
        "help"
        "lspinfo"
        "packer"
        "TelescopePrompt"
        "TelescopeResults"
        "yaml"
      ];
    };
    indent = {
      char = "│";
    };
    scope = {
      show_end = false;
      show_exact_scope = true;
      show_start = false;
    };
  };
}
