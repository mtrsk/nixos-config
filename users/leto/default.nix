{ pkgs, home, hosts, ... }:

{
  imports = [
    (import ../../home {
      username="leto";
      inherit home pkgs;
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
