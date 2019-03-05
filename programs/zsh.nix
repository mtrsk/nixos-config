{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.customPkgs = with pkgs; [
      lambda-mod-zsh-theme
    ];
    ohMyZsh.plugins = [
      "docker"
      "git"
      "mix"
      "npm"
      "python"
      "tmux"
      "vi-mode"
    ];
    ohMyZsh.theme = "lambda-mod";
  };
}
