{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = builtins.fetchGit {
    url = "https://github.com/y1lichen/my-neovim-config.git";
    ref = "refs/heads/main";
  };
}
