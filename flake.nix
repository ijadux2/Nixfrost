{
  description = "Nixfrost: Nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

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

    nixvim = {
    url = "github:nix-community/nixvim";
  };

  };

  outputs =
    inputs@{
      nixpkgs,
      stylix,
      home-manager,
      kitty-fonts,
      nixvim,
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
	  nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.jadu =
              { inputs, pkgs, ... }:
              {
                imports = [
                  ./home/jadu.nix
                ];
              };
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };
}
