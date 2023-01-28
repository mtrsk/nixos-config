{pkgs, ...}:

let
  dotfiles = ../dotfiles;
  # Convert a string to dotfiles path format
  dpath = p: builtins.toString "${dotfiles}/${p}";
in
{
  home.packages = with pkgs; [
    koreader
    obs-studio
    ranger
  ];

  programs.newsboat = {
    enable = true;
  };

  xdg.configFile = {
    "ranger" = {
      source = dpath "ranger";
      recursive = true;
    };
  };
}
