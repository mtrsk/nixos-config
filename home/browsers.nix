{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    brave
    vimb
    ungoogled-chromium
  ];

  programs.firefox = {
    enable = true;
  };
}
