{pkgs, config, inputs, username, system, ...}:

{
  imports =
    [
      # Directories
      ./development
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
      ./ranger.nix
      ./security.nix
      ./themes.nix
      ./udiskie.nix
      ./zshell.nix
    ];

  home.stateVersion = "22.05";
}
