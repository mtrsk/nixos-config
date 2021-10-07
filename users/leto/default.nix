{ pkgs, config, home, inputs, ... }:

{
  imports = [
    (import ../../home {
      username="leto";
      inherit config home pkgs inputs;
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
