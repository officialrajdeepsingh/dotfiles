{
  description = "Nixos config flake";

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

    ## NixVim using https://github.com/elythh/nixvim flake.
    nixvim = {
      url = "github:elythh/nixvim";
    };

    ## Nixvim cannot work, so I used https://github.com/elythh/nixvim flake.
    # nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
      ];
    };

    homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
      useGlobalPkgs = true;
      useUserPackages = true;
      inherit pkgs;
      modules = [
        ./home.nix
        # nixvim.homeManagerModules.nixvim  Import the nixvim.homeManagerModules.nixvim module to use nixvim at home.nix file, it cannot work.
      ];

      extraSpecialArgs = {inherit inputs;};
    };
  };
}
