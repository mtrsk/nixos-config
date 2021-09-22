{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    steam-run
    lutris
  ];
}
