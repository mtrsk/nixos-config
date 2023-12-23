{pkgs, config, ...}:

{
  # fonts.fontDir.enable = true;
  # fonts.enableDefaultFonts = true;
  # fonts.fontconfig = {
  #   enable = true;
  #   hinting.enable = true;
  #   defaultFonts = {
  #     serif = [ "Hack" "Ubuntu" ];
  #     sansSerif = [ "Hack" "Ubuntu" ];
  #     monospace = [ "Hack" "Ubuntu" ];
  #   };
  # };

  fonts.packages = with pkgs; [
    # Chinese
    arphic-ukai
    arphic-uming
    wqy_zenhei
    # Other
    font-awesome_5
    (nerdfonts.override {
      fonts = [
        "DroidSansMono"
        "FiraCode"
        "Hack"
        "Iosevka"
        "JetBrainsMono"
        "Monoid"
        "NerdFontsSymbolsOnly"
        "SourceCodePro"
        "SpaceMono"
      ];
    })
    powerline-fonts
    profont
    recursive
    roboto
    roboto-mono
    roboto-slab
    source-code-pro
    symbola
  ];
}
