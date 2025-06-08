{
  description = "Configuração NixOS do João Felipe";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      joaofelipe = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./nixos/configuration.nix

          # Integração do Home Manager ao NixOS
          home-manager.nixosModules.home-manager
         {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # O caminho do seu home.nix (crie esse arquivo se ainda não existir)
            home-manager.users.joaofelipe = import ./home.nix;
          }
        ];
      };
    };
  };
}
