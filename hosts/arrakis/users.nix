{ pkgs, config, home, inputs, system, ... }:

{
  imports = [
    (import ../../home {
      username="leto";
      inherit config home pkgs inputs system;
    })
  ];

  home.packages = with pkgs; [
    aria
    gimp
    krita
  ];
}
