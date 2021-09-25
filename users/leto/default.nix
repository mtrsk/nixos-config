{ config, lib, pkgs, ... }:

let
  username = "leto";
in
{
  imports = [
    # Extra Services
    ../../services/compton.nix
    ../../services/i3wm.nix
    ../../services/pulseaudio.nix
    # Home-Manger
    (import (
      builtins.fetchGit {
        ref = "release-21.05";
        url = "https://github.com/nix-community/home-manager";
      }
    ){}).nixos
  ];

  # For Home-Manager's ZSH
  environment.pathsToLink = [
    "/share/zsh"
  ];

  networking.extraHosts = let
    hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts";
    hostsFile = builtins.fetchurl hostsPath;
  in builtins.readFile "${hostsFile}";

  users.users."${username}" = {
    isNormalUser = true;
    createHome = true;
    group = username;
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
  users.groups."${username}".gid = 1000;

  # Home-Manager config
  home-manager.users."${username}" = { pkgs, home, ... }: {
    imports = [
      (import ../../home {
        username=username;
        inherit home pkgs;
      })
    ];

    nixpkgs.config = {
      allowUnfree = true;
      nix.useSandbox = true;
    };

    home.packages = with pkgs; [
      arandr
      xclip
      gimp
      krita
      transmission-gtk
    ];
  };
}
