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

    ## NixVim
    # nixvim = {
    #   url = "github:officialrajdeepsingh/nixvim-dotfiles/297e2adf4e3d69acb422a990b59940bb59bfced2";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   nixvim.inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
  };

  outputs =
    {
      nixpkgs,
      home-manager,
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

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        useGlobalPkgs = true;
        useUserPackages = true;
        modules = [
          ./home.nix
        ];
        inherit extraSpecialArgs; # Ensure inputs is passed
      };
    };
}
