{
  description = "Nixfrost: Nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";

    kitty-fonts = {
      url = "path:./fonts/JetBrainsMonoNerdFont-Regular.ttf";
      flake = false;
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      nixpkgs,
      stylix,
      home-manager,
      kitty-fonts,
      catppuccin,
      agenix,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.itachi = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          stylix.nixosModules.stylix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.jadu =
              { inputs, pkgs, ... }:
              {
                imports = [
                  ./home/jadu.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
          }
        ];
      };
    };
}
