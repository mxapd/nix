{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      };

  };


  outputs = { self, nixpkgs, stylix, home-manager, nixvim, ... } @ inputs:

  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
	home-manager.nixosModules.home-manager {
          home-manager.backupFileExtension = "ssdsadasasbyuissasssdadssssssasasssssssss";
          home-manager.users.xam = import ./home.nix;
          home-manager.sharedModules = [
              nixvim.homeManagerModules.nixvim
          ];
        }
        stylix.nixosModules.stylix ./configuration.nix
      ];
    };
  };
}
