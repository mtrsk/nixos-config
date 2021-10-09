{ inputs, system, pkgs, config, ... }:

let
  overlay = final: prev: {
    "eww" = inputs.eww.packages.${system}.eww;
  };
in
{
  nixpkgs.overlays = [ overlay ];

  home.packages = with pkgs; [
    eww
  ];

  xdg.configFile = {
    "eww/" = {
      source = ../../dotfiles/eww;
    };
  };
}
