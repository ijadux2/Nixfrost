{
  keymaps = [

    # File Explorer
    {
      mode = "n";
      key = "\\";
      action = "<cmd>NvimTreeToggle<CR>";
      options.desc = "Toggle File Tree";
    }

    # Telescope
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "Find files";
    }

    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>Telescope live_grep<CR>";
      options.desc = "Live grep";
    }

    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "Buffers";
    }

    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options.desc = "Help tags";
    }

    # Trouble diagnostics
    {
      mode = "n";
      key = "<S-c>";
      action = "<cmd>TroubleToggle<CR>";
      options.desc = "Diagnostics";
    }

    {
      mode = "n";
      key = "<leader>xw";
      action = "<cmd>TroubleToggle workspace_diagnostics<CR>";
      options.desc = "Workspace diagnostics";
    }

    # Terminal
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>ToggleTerm<CR>";
      options.desc = "Toggle terminal";
    }

    # Yazi file manager
    {
      mode = "n";
      key = "]";
      action = "<cmd>Yazi<CR>";
      options.desc = "Open Yazi";
    }

    # LSP
    {
      mode = "n";
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      options.desc = "Goto definition";
    }

    {
      mode = "n";
      key = "gr";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      options.desc = "References";
    }

    {
      mode = "n";
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      options.desc = "Hover docs";
    }

    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      options.desc = "Rename symbol";
    }

  ];
}
