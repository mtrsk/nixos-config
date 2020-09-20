{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    lutris
    #retroarch
    steam
  ];
}
