{ config, pkgs, ... }:

{
  # 啟用 OpenSSH 伺服器
  services.openssh.enable = true;

  # 如果您打算使用 SSH Key，可以將其設為 false
  services.openssh.passwordAuthentication = true; 
  
  # (可選) 允許 root 帳號登入 (出於安全考量，一般不推薦)
  # services.openssh.permitRootLogin = "no";
  
  # 開啟 TCP Port 22，允許外部連線進入
  networking.firewall.allowedTCPPorts = [ 22 ];

  imports = [
    ../modules/core.nix
    ../modules/user.nix
    ../modules/hardware/vm.nix
  ];

  system.stateVersion = "25.05";
}
