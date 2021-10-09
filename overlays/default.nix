{ pkgs, inputs, system, ... }:

let
  eww = final: prev: { "eww" = inputs.eww.packages.${system}.eww; };
in
{
  nixpkgs.overlays = [
    inputs.emacs.overlay
    eww
  ];
}
