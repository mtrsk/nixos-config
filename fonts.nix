{pkgs, config, ...}:

{
  # fonts.fontDir.enable = true;
  # fonts.enableDefaultFonts = true;
  # fonts.fontconfig = {
  #   enable = true;
  #   hinting.enable = true;
  #   includeUserConf = true;
  # };

  fonts.fonts = with pkgs; [
    font-awesome_5
    hack-font
    iosevka
    jetbrains-mono
    mplus-outline-fonts
    nerdfonts
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
