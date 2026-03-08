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
  ];
}
