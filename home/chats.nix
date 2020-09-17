{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    discord
    #ripcord
    tdesktop
    weechat
  ];
}
