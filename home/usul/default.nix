{ config, lib, pkgs, ... }:

{
  imports = [
    # Extra Services
    ../../services/compton.nix
    ../../services/i3wm.nix
    ../../services/localization.nix
    ../../services/pulseaudio.nix
    # Home-Manger
    (import (
      builtins.fetchGit {
        ref = "master";
        url = "https://github.com/nix-community/home-manager";
      }
    ){}).nixos
  ];

  # For Home-Manager's ZSH
  environment.pathsToLink = [
    "/share/zsh"
  ];

  users.groups.usul.gid = 1000;

  users.users = {
    usul = {
      isNormalUser = true;
      createHome = true;
      description = "Usul";
      group = "usul";
      uid = 1000;
      extraGroups = [
        "wheel"
        "docker"
        "video"
        "audio"
        "disk"
        "networkmanager"
      ];
      shell = pkgs.zsh;
    };
  };

  # Home-Manager config
  home-manager.users.usul = { pkgs, home, ... }: {
    imports = [
      ../browsers.nix
      ../chats.nix
      ../development.nix
      ../editors.nix
      ../gaming.nix
      (import ../media.nix {
        user="usul";
        inherit home pkgs;
      })
      (import ../rice.nix {
        user="usul";
        inherit home pkgs;
      })
    ];

    nixpkgs.config = {
      allowUnfree = true;
      nix.useSandbox = true;
    };

    home.packages = with pkgs; [
      arandr
      dict
      scrot
      xclip
      # Daemons
      earlyoom
      # Graphics/Design
      gimp
      krita
      # Torrents
      transmission-gtk
    ];
  };
}
