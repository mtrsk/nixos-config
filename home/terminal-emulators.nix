{pkgs, ...}:

{
  home.packages = with pkgs; [
    kitty
  ];

  xdg.configFile = {
    "kitty/kitty.conf".source = ../dotfiles/kitty/kitty.conf;
  };
}
