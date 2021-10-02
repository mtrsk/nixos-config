{pkgs, username, ...}:

{
  imports =
    [
      ./development
      ./browsers.nix
      ./chats.nix
      ./common.nix
      ./crypto.nix
      ./editors.nix
      ./emacs.nix
      ./gaming.nix
      (import ./media.nix {
        user=username;
        inherit pkgs;
      })
      (import ./rice.nix {
        user=username;
        inherit pkgs;
      })
      ./security.nix
      ./terminal-emulators.nix
      ./udiskie.nix
      ./zshell.nix
    ];
}
