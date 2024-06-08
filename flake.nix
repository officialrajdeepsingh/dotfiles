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

    ## Nixvim
    # nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };

    nixvim.url = "github:officialrajdeepsingh/nixvim/custom";

    # nixvim.url = "path:./nixvim";
     
    # nixvim.url = "git+file:./nixvim/flake.nix";
    
    # ---Auto CPU---
    # auto-cpufreq = {
    #  url = "github:AdnanHodzic/auto-cpufreq";
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };
    # ---Auto CPU---
  };

 outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {  
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
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
        extraSpecialArgs = { inherit inputs; };
      };
  };
}
