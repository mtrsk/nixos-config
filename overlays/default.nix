{ pkgs, inputs, system, ... }:

#let
#  eww = final: prev: { "eww" = inputs.eww.packages.${system}.eww; };
#in
{
  nixpkgs.overlays = [
    inputs.emacs.overlay
    #eww
    (final: prev: {
      postman = prev.postman.overrideAttrs(old: rec {
        version = "20231205182607";
        src = final.fetchurl {
          url = "https://web.archive.org/web/${version}/https://dl.pstmn.io/download/latest/linux_64";
          sha256 = "sha256-PthETmSLehg6eWpdDihH1juwiyZdJvzr+qyG2YYuEZI=";
          name = "${old.pname}-${version}.tar.gz";
        };
      });
    })
  ];
}
