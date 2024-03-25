{
  description = "Nixos config flake";


   inputs = {
  
     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };


    # ---Auto CPU---
    # auto-cpufreq = {
    #  url = "github:AdnanHodzic/auto-cpufreq";
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };
    # ---Auto CPU---

    # NixVim
      nixvim = {
        url = "github:nix-community/nixvim/nixos-23.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

  };

 outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
       nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
             inputs.home-manager.nixosModules.default
          ];
       };
   };
}
