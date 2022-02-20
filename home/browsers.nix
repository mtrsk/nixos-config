{pkgs, config, ...}:

{
  home.packages = with pkgs; [
    brave
    firefox-bin
    nyxt
  ];
}
