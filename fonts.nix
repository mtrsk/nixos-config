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

  fonts.fonts = with pkgs; [
    # Chinese
    arphic-ukai
    arphic-uming
    wqy_zenhei
    # Other
    font-awesome_5
    hack-font
    iosevka
    jetbrains-mono
    # mplus-outline-fonts
    # nerdfonts
    powerline-fonts
    profont
    proggyfonts
    recursive
    roboto
    roboto-mono
    roboto-slab
    source-code-pro
    symbola
  ];
}
