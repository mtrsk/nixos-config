self: super:

{
  lutris = super.lutris.overrideAttrs ( old: rec {
    version = "0.5.8.3";

    src = super.pkgs.fetchFromGitHub {
        owner = "lutris";
        repo = "lutris";
        rev = "v${version}";
        sha256 = "03gkaxa0nzfri41v0n3j6pwxgq8j3904f1md25mr5z02nkmqw3l6";
    };
  });
}
