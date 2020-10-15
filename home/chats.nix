{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    discord
    #ripcord
    signal-desktop
    tdesktop
    weechat
  ];
}
