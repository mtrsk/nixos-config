{ pkgs, config, nix-colors, ... }:

with nix-colors.lib { inherit pkgs; };

{
  imports = [ nix-colors.homeManagerModule ];

  colorscheme = colorschemeFromPicture {
    path = ../../wallpapers/nixos_lain.png;
    kind = "dark";
  };
}
