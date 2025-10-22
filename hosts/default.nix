{ config, pkgs, ... }:

{
  imports = [
    ../modules/core.nix
    ../modules/user.nix
    ../modules/hardware/vm.nix
  ];

  system.stateVersion = "25.05";
}
