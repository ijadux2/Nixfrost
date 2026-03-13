{ ... }:

{
  programs.starship = {
    enable = true;
    # enableNushellIntegration = true;
    enableZshIntegration = true;
    enableBashIntegration = false;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = ''
        $directory$git_branch$git_status$git_commit
        $character
      '';

      right_format = ''
        $nodejs$rust$python$golang$java$kotlin$lua$nim$zig$deno$php$swift$c$cpp
      '';

      palette = "catppuccin_mocha";
      command_timeout = 500;

      directory = {
        style = "fg:lavender";
        truncation_length = 3;
        truncation_symbol = "~/";
        read_only = " 󰌾";
        format = "[$path]($style)[$read_only]($read_only_style) ";
      };

      # λ ❯
      character = {
        success_symbol = "[λ](bold fg:lavender)";
        error_symbol = "[λ](bold fg:red)";
      };

      git_branch = {
        symbol = " ";
        style = "bold fg:mauve";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        ignore_submodules = true;
        format = "([$ahead_behind]($style)) ";
      };

      git_commit = {
        tag_symbol = "  ";
        format = "[ $hash]($style) ";
        style = "fg:overlay1";
        commit_hash_length = 7;
        only_detached = false;
      };

      # Language and Tool Symbols
      bun.symbol = " ";
      c.symbol = " ";
      cpp.symbol = " ";
      cmake.symbol = " ";
      golang.symbol = " ";
      haskell.symbol = " ";
      hg_branch.symbol = " ";
      hostname.ssh_symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      os.symbols.NixOS = " ";
      package.symbol = "󰏗 ";
      python.symbol = " ";
      rust.symbol = "󱘗 ";
      status.symbol = " ";
      xmake.symbol = " ";
      zig.symbol = " ";

      # Palettes
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}
