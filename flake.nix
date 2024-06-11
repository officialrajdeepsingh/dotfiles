{
  description = "Nixos config flake";

  inputs = {
    ## NixPkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    ## Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ## NixVim
    nixvim = {
      url = "github:elythh/nixvim";
    };

    # ---Auto CPU---
    # auto-cpufreq = {
    #  url = "github:AdnanHodzic/auto-cpufreq";
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };
    # ---Auto CPU---
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
      ];
      extraSpecialArgs = {inherit inputs;};
    };
  };
}
