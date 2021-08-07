{}:

let
  dotfiles = ../dotfiles;
in
{
  dpath = p: builtins.toString "${dotfiles}/${p}";
}
