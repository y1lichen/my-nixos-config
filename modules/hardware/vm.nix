{ config, pkgs, ... }:

{
  fileSystems."/".device = "/dev/vda1";
  fileSystems."/".fsType = "ext4";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop";
}