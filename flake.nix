{
  description = "YiLiChen's modular NixOS config with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # 這裡加入你的 Neovim 設定 repo
    my-nvim.url = "github:y1lichen/my-neovim-config";
  };

  outputs = { self, nixpkgs, home-manager, my-nvim, ... }: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.chen = import ./modules/home/default.nix {
            inherit my-nvim;
          };
        }
      ];
    };
  };
}
