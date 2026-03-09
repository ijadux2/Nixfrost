{ ... }:

{
  noice = {
    enable = true;
    settings = {
      # 1. Use the 'cmdline_popup' for the main entry point
      presets = {
        bottom_search = false; # Keeps search away from the bottom
        command_palette = true; # Enables the centered palette feel
        long_message_to_split = true;
        inc_rename = true; # Support for incremental renaming
      };

      # 2. Define the Position and Border
      views = {
        cmdline_popup = {
          position = {
            row = "15%"; # Adjust this to move it higher or lower
            col = "50%";
          };
          size = {
            width = 60;
            height = "auto";
          };
          border = {
            style = "rounded"; # Matches your nvim-cmp borders
            padding = [
              0
              1
            ];
          };
        };

        # 3. Apply similar styling to search prompts
        popupmenu = {
          relative = "editor";
          position = {
            row = "25%"; # Positioned just below the cmdline
            col = "50%";
          };
          size = {
            width = 60;
            height = 10;
          };
          border = {
            style = "rounded";
            padding = [
              0
              1
            ];
          };
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:DiagnosticInfo";
          };
        };
      };
    };
  };
}
