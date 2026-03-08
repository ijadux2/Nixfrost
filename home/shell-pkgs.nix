{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # hugo
    (pkgs.writeShellApplication {
      name = "hud"; # The command you'll type in the terminal
      runtimeInputs = with pkgs; [
        git
        hugo
      ];
      text = ''
        project="$HOME/ijadux2/Ijadux2.blog/"
          cd "$project" || exit 1
          echo "building the project ..."
          hugo 
          echo "adding the build files to git .."
          git add .
          echo "committing all files .."
          read -rp "commit message >> " msg
          git commit -m "$msg"
          echo "pushing the code to github .."
          git push -u origin main
      '';
    })

    ## lock
    (pkgs.writeShellApplication {
      name = "lock";
      runtimeInputs = with pkgs; [
        hyprlock
      ];
      text = ''
        hyprlock
      '';
    })

    (pkgs.writeShellApplication {
      name = "nixi";
      runtimeInputs = with pkgs; [ git ];
      text = ''
        nixos="/home/jadu/codespace/Nixfrost/"
        cd "$nixos" || exit 1
        echo "adding files and commiting .."
        git add .
        read -rp "Commit msg for Nixos-config >> " msg 
        git commit -m "$msg"
        echo "pushing to github .."
        git push -u origin main
        echo "pushed ..."
      '';
    })

    (pkgs.writeShellApplication {
      name = "rebuild";
      runtimeInputs = [ ];
      text = ''
        echo "building your nixos config .. "
        sudo nixos-rebuild switch --flake /home/jadu/codespace/Nixfrost/#itachi
        echo "build complete !!"
      '';
    })
  ];
}
