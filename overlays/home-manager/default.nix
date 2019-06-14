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
    installPhase = ''
      install -v -D -m755 ${src}/home-manager/home-manager $out/bin/home-manager

      substituteInPlace $out/bin/home-manager \
        --subst-var-by bash "${self.bash}" \
        --subst-var-by coreutils "${self.coreutils}" \
        --subst-var-by findutils "${self.findutils}" \
        --subst-var-by gnused "${self.gnused}" \
        --subst-var-by less "${self.less}" \
        --subst-var-by HOME_MANAGER_PATH '${src}'
    '';
  });
}
