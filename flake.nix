{
  description = "YiLiChen's modular NixOS config with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    my-nvim-config = {
      url = "github:y1lichen/my-neovim-config";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, my-nvim-config, ... }: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.chen = import ./modules/home/default.nix {
             inherit my-nvim-config;
          };
        }
      ];
    };
  };
}
