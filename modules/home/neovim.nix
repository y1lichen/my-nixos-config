{ config, pkgs, my-nvim, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = "${my-nvim}";
}
