{ pkgs, home, hosts, ... }:

{
  imports = [
    (import ../../home {
      username="leto";
      inherit home pkgs;
    })
  ];

  home.packages = with pkgs; [
    arandr
    xclip
    gimp
    krita
    transmission-gtk
  ];
}
