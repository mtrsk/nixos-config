{pkgs, home, ...}:

{
  #nixpkgs.overlays = [
  #  (import ../overlays/lutris.nix)
  #];

  home.packages = with pkgs; [
    steam-run
  ];
}
