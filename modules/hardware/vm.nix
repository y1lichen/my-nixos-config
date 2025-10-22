{ config, pkgs, ... }:

{
  fileSystems."/".device = "/dev/vda2";
  fileSystems."/".fsType = "ext4";

  fileSystems."/boot/efi" = {
    device = "/dev/vda1";
    fsType = "vfat";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "laptop";
}
