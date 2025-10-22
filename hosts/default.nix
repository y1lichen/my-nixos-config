{ config, pkgs, ... }:

{
  imports = [
    ../modules/core.nix
    ../modules/user.nix
    /etc/nixos/hardware-configuration.nix 
  ];

  system.stateVersion = "25.05";
}
