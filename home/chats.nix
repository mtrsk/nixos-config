{pkgs, ...}:

{
  home.packages = with pkgs; [
    discord
    # ferdi
    slack
    signal-desktop
    tdesktop
    teams
  ];
}
