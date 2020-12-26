{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    brave
    firefox-bin
    ungoogled-chromium
  ];

  #programs.firefox = {
  #  enable = true;
  #};
}
