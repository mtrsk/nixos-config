{ user }:

let
  path = "/home/${user}/.cache/wal/colors.json";
  json = builtins.fromJSON (builtins.readFile path);
in
  json
