self: super:

{
  home-manager = super.home-manager.overrideAttrs ( old: rec {
    name = "home-manager-${version}";
    version = "2019-04-23";
    src = super.fetchFromGitHub {
      owner = "rycee";
      repo = "home-manager";
      rev = "ba0375bf06e0e0c3b2377edf913b7fddfd5a0b40";
      sha256 = "1ksr8fw5p5ai2a02whppc0kz9b3m5363hvfjghkzkd623kfh9073";
    };
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
