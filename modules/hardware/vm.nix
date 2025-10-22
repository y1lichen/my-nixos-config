{ config, pkgs, ... }:

{
  fileSystems."/".device = "/dev/vda1";
  fileSystems."/".fsType = "ext4";

  swapDevices = [
    { device = "/dev/vda2"; }
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.efi.enable = false;

  networking.hostName = "laptop";
}
