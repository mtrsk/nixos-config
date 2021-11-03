{pkgs, config, inputs, username, ...}:

{
  imports =
    [
      # Directories
      ./development
      (import ./rice {
        inherit pkgs config inputs;
      })
      # Files
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
      ./udiskie.nix
      ./zshell.nix
    ];
}
