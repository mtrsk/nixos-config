{pkgs, home, ...}:

let
  dotfiles = ../dotfiles;
  # Convert a string to dotfiles path format
  dpath = p: builtins.toString "${dotfiles}/${p}";
in
{
  home.packages = with pkgs; [
    kitty
  ];

  xdg.configFile = {
    "kitty/kitty.conf".source = dpath "kitty/kitty.conf";
  };
}
