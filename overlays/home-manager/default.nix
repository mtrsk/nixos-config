self: super:

let
  json = builtins.fromJSON (builtins.readFile ./version.json);
  date = json.date;
  home-manager-src = super.fetchFromGitHub {
    owner = "rycee";
    repo = "home-manager";
    inherit (json) rev sha256;
  };
in
{
  home-manager = super.home-manager.overrideAttrs ( old: rec {
    name = "home-manager-${version}";
    version = builtins.substring 0 10 date;
    src = home-manager-src;
  });
}
