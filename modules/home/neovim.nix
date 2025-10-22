{ pkgs, my-nvim-config, ... }:
{

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim" = {

    source = my-nvim-config; 
    
    type = "directory";
    force = true; 
  };

  home.packages = with pkgs; [
    nodejs 
    lua-language-server
  ];
}