{
  cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      # 1. Borders for the UI
      window = {
        completion = {
          border = "rounded"; # Or "single", "double", "solid"
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
        };
        documentation = {
          border = "rounded";
        };
      };

      # 2. Behavior: Auto-select first item and show menu by default
      completion = {
        completeopt = "menu,menuone,noinsert";
      };

      # 3. Arrow Key Navigation
      mapping = {
        "<Down>" = "cmp.mapping.select_next_item()";
        "<Up>" = "cmp.mapping.select_prev_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };

      # 4. Sources for suggestions
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; } # Snippets
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
  };
}
