{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # Audio
      enable_audio_bell = "no";

      # Shell & Editor
      shell = "${pkgs.zsh}/bin/zsh";
      editor = "${pkgs.neovim}/bin/nvim";

      # Cursor
      cursor_shape = "block";

      # Tabs
      tab_bar_edge = "top";

      # Transparency
      dynamic_background_opacity = "no";

      # Window
      confirm_os_window_close = "0";
    };
  };
}
