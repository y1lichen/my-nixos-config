{ config, pkgs, ... }:

{
  imports = [
    ../modules/core.nix
    ../modules/user.nix
    ../modules/devtools.nix
  ];

  system.stateVersion = "25.05";
}
