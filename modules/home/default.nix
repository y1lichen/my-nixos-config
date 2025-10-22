{ config, pkgs, my-nvim-config, ... }:
{
  imports = [

    ./git.nix
    (import ./neovim.nix { inherit pkgs config my-nvim-config; }) 
  ];

  home.username = "chen";
  home.homeDirectory = "/home/chen";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}