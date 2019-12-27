{ config, lib, pkgs, ... }:

{
  imports = [
    # Custom Modules
    ../../../modules/ipfs-daemon
    # Extra Services
    ../../../services/compton.nix
    ../../../services/i3wm.nix
    ../../../services/localization.nix
    ../../../services/pulseaudio.nix
    # Home-Manger
    (import (
      builtins.fetchGit {
        ref = "master";
        url = "https://github.com/rycee/home-manager";
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
  home-manager.users.usul = { pkgs, ... }: {
    imports = [
      ./home.nix
    ];
  };
}
