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
        ollama
      ];
      text = ''
              # Functions
        switch_nixos() {
          echo "Building your NixOS config..."
          sudo nixos-rebuild switch --flake /home/jadu/codespace/Nixfrost/#itachi
          echo "Build complete!!"
        }

        manim() {
          echo -n "topic for man >> "
          read -r to
          [[ -z "$to" ]] && return
          nvim -c "Man $to" +only
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

        fedora() {
          distrobox enter fedx
        }

        gitall() {
          read -pr "commit msg for git >> " msg
          git add .
          git commit -m "$msg"
          git push
        }

        web() {
          webui="/home/jadu/ijadux2/zetsu/web-ui/"
          port="1709"
          cd "$webui" || echo "cd failed, serving from $(pwd)"
          python3 -m http.server $port
        }

        # Logic: Check the first argument passed to the script ($1)
        case "''${1:-}" in
        ui)
          web
          ;;
        rebuild)
          switch_nixos
          ;;
        git)
          nixi
          ;;
        hud)
          hugo_build
          ;;
        star)
          startup
          ;;
        fedx)
          fedora
          ;;
        git-add)
          gitall
          ;;
        man)
          manim
          ;;
        -h)
          echo "Usage: nixfy {rebuild|config-git|hud|star|fedx}"
          exit 1
          ;;
        esac
      '';
    })
    (pkgs.writeShellApplication {
      name = "nv";
      runtimeInputs = with pkgs; [
        fzf
        neovim
        bat # Added bat since you are using it in the preview
      ];
      text = ''
        # No need for fn() { ... } here
        file=$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')

        if [ -n "$file" ]; then
          nvim "$file"
        fi
      '';
    })
    (pkgs.writeShellApplication {
      name = "mp";
      runtimeInputs = with pkgs; [
        bash
        fzf
        ffmpeg_7-full
      ];
      text = ''
        bash ~/codespace/music-player/fzf.sh
      '';
    })
  ];
}
