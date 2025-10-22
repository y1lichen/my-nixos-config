{ config, pkgs, ... }:

{
  imports = [
    ../modules/core.nix
    ../modules/user.nix
  ];

  system.stateVersion = "25.05";
}
