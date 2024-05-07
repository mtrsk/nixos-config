{ pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

      scrolling = {
        history = 5000;
      };

      font = {
        size = 17;
      };

      shell = {
        program = "${pkgs.zsh}/bin/zsh";
      };
    };
  };
}
