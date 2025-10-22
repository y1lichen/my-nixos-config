{ ... }:

{
  programs.git = {
    enable = true;
    userName = "y1lichen";
    userEmail = "f1jefferson2@gmail.com";

    aliases = {
      co = "checkout";
      br = "branch";
      st = "status";
    };
  };
}
