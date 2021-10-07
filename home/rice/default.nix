{ pkgs, config, nix-colors, ... }:

let
  colorscheme = (import ./colorscheme.nix {inherit pkgs config nix-colors;}).colorscheme;
in
{
  imports = [
    (import ./kitty.nix { inherit pkgs colorscheme; })
  ];
}
