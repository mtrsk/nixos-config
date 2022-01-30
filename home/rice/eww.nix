{ pkgs, config, inputs, system, ... }:

{
  home.packages = with pkgs; [
    eww-wayland
  ];

  #xdg.configFile = {
  #  "eww/" = {
  #    source = ../../dotfiles/eww;
  #  };
  #};
}
