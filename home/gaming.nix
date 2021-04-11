{pkgs, home, ...}:

{
  #nixpkgs.overlays = [
  #  (import ../overlays/lutris.nix)
  #];

  home.packages = with pkgs; [
    lutris
    # lutris-related
    dbus
    freetype
    gnutls
    libgcrypt
    libgpgerror
    libxml2
    openldap
    SDL
    #
    steam-run
  ];
}
