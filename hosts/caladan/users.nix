{ pkgs, config, home, inputs, system, ... }:

{
  imports =
    [
      # Directories
      ../../home/development
      ../../home/browsers.nix
      ../../home/chats.nix
      ../../home/common.nix
      ../../home/editors.nix
      ../../home/emacs.nix
      ../../home/gaming.nix
      ../../home/ranger.nix
      ../../home/rice
      ../../home/security.nix
      ../../home/zshell.nix
    ];

  home.packages = with pkgs; [
    #gnomeExtensions.freon
    jetbrains.rider
    gimp
    krita
    mpv
    remmina
    postman
  ];

  home.stateVersion = "22.11";
}
