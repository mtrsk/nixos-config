{ pkgs, lib, inputs, system, ... }:

{
  nixpkgs.overlays = [
    inputs.emacs.overlay
  ];
}

