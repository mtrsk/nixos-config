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
        version = "20230716100528";
        src = final.fetchurl {
          url = "https://web.archive.org/web/${version}/https://dl.pstmn.io/download/latest/linux_64";
          sha256 = "sha256-svk60K4pZh0qRdx9+5OUTu0xgGXMhqvQTGTcmqBOMq8=";

          name = "${old.pname}-${version}.tar.gz";
        };
      });
    })
  ];
}
