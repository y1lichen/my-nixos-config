{ config, pkgs, ... }:

{
  boot.initrd.availableKernelModules = [ "virtio_pci" "virtio_blk" "virtio_scsi" ];
  boot.initrd.kernelModules = [ "virtio_pci" "virtio_blk" ];

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

  networking = {
    hostName = "laptop";
    nameservers = [ "8.8.8.8" "1.1.1.1" ];    
    # networkmanager.enable = true; 
  };
}
