self: super:

let
  json = builtins.fromJSON (builtins.readFile ./version.json);
  date = json.date;
  home-manager-src = super.fetchFromGitHub {
    owner = "rycee";
    repo = "home-manager";
    rev = json.rev;
    sha256 = json.sha256;
  };
in
{
  home-manager = super.home-manager.overrideAttrs ( old: rec {
    name = "home-manager-${version}";
    version = with super;
      builtins.head (
        builtins.match "([0-9]{4}-[0-9]{2}-[0-9]{2}).*" date
      );
    src = home-manager-src;
    installPhase = with super; ''
      install -v -D -m755 ${src}/home-manager/home-manager $out/bin/home-manager

      substituteInPlace $out/bin/home-manager \
        --subst-var-by bash "${bash}" \
        --subst-var-by coreutils "${coreutils}" \
        --subst-var-by findutils "${findutils}" \
        --subst-var-by gnused "${gnused}" \
        --subst-var-by less "${less}" \
        --subst-var-by HOME_MANAGER_PATH '${src}'
    '';
  });
}
