{ pkgs, config, home, nix-colors, ... }:

{
  imports = [
    (import ../../home {
      username="leto";
      inherit config home pkgs nix-colors;
    })
  ];

  home.packages = with pkgs; [
    aria
    arandr
    xclip
    gimp
    krita
  ];
}
