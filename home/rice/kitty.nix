{ pkgs, config, nix-colors, ... }:

{
  imports = [ nix-colors.homeManagerModule ];

  colorscheme = (import ./kitty.nix {inherit pkgs config nix-colors;}).colorscheme;

  programs = let colorscheme = config.colorscheme;
  in {
    kitty = {
      settings = {
        foreground = "#${colorscheme.colors.base07}";
        background = "#${colorscheme.colors.base00}";
        cursor = "#${colorscheme.colors.base15}";

        color0 = "#${colorscheme.colors.base00}";
        color1 = "#${colorscheme.colors.base01}";
        color2 = "#${colorscheme.colors.base02}";
        color3 = "#${colorscheme.colors.base03}";
        color4 = "#${colorscheme.colors.base04}";
        color5 = "#${colorscheme.colors.base05}";
        color6 = "#${colorscheme.colors.base06}";
        color7 = "#${colorscheme.colors.base07}";
        color8 = "#${colorscheme.colors.base08}";
        color9 = "#${colorscheme.colors.base09}";
        color10 = "#${colorscheme.colors.base10}";
        color11 = "#${colorscheme.colors.base11}";
        color12 = "#${colorscheme.colors.base12}";
        color13 = "#${colorscheme.colors.base13}";
        color14 = "#${colorscheme.colors.base14}";
        color15 = "#${colorscheme.colors.base15}";
      };
    };
  };
}
