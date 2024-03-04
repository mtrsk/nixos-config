{pkgs, config, inputs, username, system, ...}:

{
  imports =
    [
      # Directories
      ./development
      (import ./rice {
        inherit pkgs config inputs system;
      })
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
      ./security.nix
      ./udiskie.nix
      ./zshell.nix
    ];

  home.stateVersion = "22.05";
}
