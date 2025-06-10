{
  description = "Configuração NixOS do João Felipe";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.joaofelipe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.joaofelipe = import ./home;
          };
        }
      ];
    };
  };
}
