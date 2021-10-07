{ pkgs, nix-colors, colorscheme, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Operator Mono Book";
      size = 16;
    };

    settings = {
      # Audio
      enable_audio_bell = "no";

      # Colorschemes
      active_border_color = "#${colorscheme.colors.base07}";
      inactive_border_color = "#${colorscheme.colors.base00}";
      bell_border_color = "#${colorscheme.colors.base04}";

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

      # Cursor
      cursor_shape = "block";

      # Tabs
      tab_bar_edge = "top";

      # Transparency
      background_opacity = 0.95;
      dynamic_background_opacity = "no";
    };
  };
}
