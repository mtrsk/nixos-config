{pkgs, username, ...}:

{
  imports =
    [
      # Directories
      ./development
      ./rice
      # Files
      ./browsers.nix
      ./chats.nix
      ./common.nix
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
      ./udiskie.nix
      ./zshell.nix
    ];
}
