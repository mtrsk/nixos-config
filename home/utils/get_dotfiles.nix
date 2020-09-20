{}:

let
  dotfiles = ../../dotfiles;
in
{
  dfiles = dotfiles;
  dpath = p: builtins.toString "${dotfiles}/${p}";
}
