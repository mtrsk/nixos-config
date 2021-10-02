{}:

let
  path = ./colors.json;
  json = builtins.fromJSON (builtins.readFile path);
in
  json
