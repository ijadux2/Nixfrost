{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    (pkgs.writeShellApplication {
      name = "nixfy";
      runtimeInputs = with pkgs; [
        git
        hugo
        nixos-rebuild
        bash
      ];
      text = ''
              # Functions
        switch_nixos() {
          echo "Building your NixOS config..."
          sudo nixos-rebuild switch --flake /home/jadu/codespace/Nixfrost/#itachi
          echo "Build complete!!"
        }

        nixi() {
          local nixos="/home/jadu/codespace/Nixfrost/"
          cd "$nixos" || exit 1
          echo "Adding files and committing..."
          git add .
          read -rp "Commit msg for Nixos-config >> " msg
          git commit -m "$msg"
          echo "Pushing to GitHub..."
          git push -u origin main
          echo "Pushed..."
        }

        hugo_build() {
          local project="$HOME/ijadux2/Ijadux2.blog/"
          cd "$project" || exit 1
          echo "Building the project..."
          hugo
          echo "Adding the build files to git..."
          git add .
          read -rp "Commit message >> " msg
          git commit -m "$msg"
          git push -u origin main
        }

        startup() {
          local startup_dir="$HOME/ijadux2/Startup/"
          cd "$startup_dir" || exit 1
          echo "Building the project..."
          hugo
          echo "Adding the build files to git..."
          git add .
          read -rp "Commit message >> " msg
          git commit -m "$msg"
          git push -u origin main
        }

        # Logic: Check the first argument passed to the script ($1)
        case "''${1:-}" in
        rebuild)
          switch_nixos
          ;;
        config-git)
          nixi
          ;;
        hud)
          hugo_build
          ;;
        star)
          startup
          ;;
        *)
          echo "Usage: nixfy {rebuild|config-git|hud|star}"
          exit 1
          ;;
        esac
      '';
    })
  ];
}
