{ config, pkgs, ... }:

{
  users.users.chen = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # sudo 權限
    shell = pkgs.bashInteractive;
  };

  security.sudo.enable = true;
}
