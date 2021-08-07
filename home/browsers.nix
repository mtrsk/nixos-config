{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    brave
    firefox-bin
  ];
}
