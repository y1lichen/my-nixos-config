{ config, pkgs, my-nvim-config, ... }:
{
  imports = [

    ./git.nix
    ./neovim.nix
    ./tmux.nix
  ];

  home.username = "chen";
  home.homeDirectory = "/home/chen";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    htop
    fastfetch
  ];
  programs.home-manager.enable = true;
}