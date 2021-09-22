{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    discord
    slack
    signal-desktop
    tdesktop
  ];
}
