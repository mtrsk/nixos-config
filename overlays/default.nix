{ pkgs, inputs, system, ... }:

{
  nixpkgs.overlays = [
    inputs.emacs.overlay
    #(final: prev: {
    #  postman = prev.postman.overrideAttrs(old: rec {
    #    version = "20240205183313";
    #    src = final.fetchurl {
    #      url = "https://web.archive.org/web/${version}/https://dl.pstmn.io/download/latest/linux_64";
    #      sha256 = "sha256-es39Bsv9tZXGagV5YFFVHkIzeq1hkVH6v8M5NjjqOJw=";
    #      name = "${old.pname}-${version}.tar.gz";
    #    };
    #  });
    #})
  ];
}
