{ config, lib, pkgs, ...}:

{
  imports = [
    #../systemd/ipfs-service.nix
    ../systemd/home-manager-update.nix
    ../services/pulseaudio.nix
  ];

  # For Home-Manager's ZSH
  environment.pathsToLink = [
    "/share/zsh"
  ];

  users.groups = {
    usul = {
      gid = 1000;
    };
  };

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
      # The set of packages that should be made availabe to the user.
      packages = (with pkgs; [
        # Base Packages
        home-manager
        # Utils
        polybar
      ]);
      shell = pkgs.zsh;
    };
  };
}
