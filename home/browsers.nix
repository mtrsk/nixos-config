{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    brave
    vimb
  ];

  programs.firefox = {
    enable = true;
  };
}
