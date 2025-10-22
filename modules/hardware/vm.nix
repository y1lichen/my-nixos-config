{ config, pkgs, ... }:

{
  # Root 分割槽
  fileSystems."/".device = "/dev/vda1";
  fileSystems."/".fsType = "ext4";

  # swap
  swapDevices = [
    { device = "/dev/vda2"; }
  ];

  # Bootloader（GRUB 安裝到 MBR）
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";

  # 主機名稱
  networking.hostName = "laptop";
}
