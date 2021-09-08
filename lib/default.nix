{}:

let
  dotfiles = ../dotfiles;
in
{
  dotfiles_path = p: builtins.toString "${dotfiles}/${p}";
}
