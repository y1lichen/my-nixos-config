{ config, pkgs, my-nvim-config, ... }:
{
  imports = [

    ./git.nix
    ./neovim.nix
  ];

  home.username = "chen";
  home.homeDirectory = "/home/chen";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}