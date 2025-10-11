{
  description = "Personal NixOS configuration flake build for daily use.";

  inputs = {

    ## NixPkgs
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    ## Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nvf,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      # For Home Manager
      extraSpecialArgs = {
        inherit system;
        inherit inputs;
      };

      # For NixOS
      specialArgs = {
        inherit system;
        inherit inputs;
      };

    in
    {

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./configuration.nix
        ];
      };

      homeConfigurations."officialrajdeepsingh@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          nvf.homeManagerModules.default # <- this imports the home-manager module that provides the options
          ./home.nix
        ];
        inherit extraSpecialArgs; # Ensure inputs is passed
      };
    };
}
