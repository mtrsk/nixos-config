{ pkgs ? import <nixpkgs> {}, user }:

let
  json = import ../wal-colors.nix { user=user; };
  conky-config = import ./conky-config.nix {
    inherit json;
  };
  conky-config-file = pkgs.writeTextFile {
    name = "conkyrc";
    text = conky-config;
  };
  conky-bin = "${pkgs.conky}/bin/conky";
in
  pkgs.writeScript "launch.sh"
    ''
      pidof conky && killall -r conky

      ${conky-bin} -c ${conky-config-file}
    ''
