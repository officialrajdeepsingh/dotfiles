{
  description = "NixOS config flake";

  inputs = {

    ## NixPkgs
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };

    ## Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ## NixVim
    nixvim = {
      url = "github:officialrajdeepsingh/nixvim-dotfiles";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

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

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {

        pkgs = nixpkgs.legacyPackages.${system};
        useGlobalPkgs = true;
        useUserPackages = true;
        modules = [ ./home.nix ];
        inherit extraSpecialArgs; # Ensure inputs is passed
      };
    };
}
