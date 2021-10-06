{ pkgs, ... }:

{
  home.packages = with pkgs; [
    conky
    dmenu
    i3lock-fancy
    neofetch
    pywal
  ];

  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ../dotfiles/polybar/config;
    package = pkgs.polybarFull;
    script = builtins.readFile ../dotfiles/polybar/launch.sh;
  };

  xdg.configFile = {
    polybar = {
      source = ../dotfiles/polybar;
      recursive = true;
    };
  };

  home.file.".i3" = {
    source = ../dotfiles/i3wm;
    recursive = true;
  };

  home.sessionVariables = {
    SPACESHIP_EXIT_CODE_SHOW = "true";
  };
}
