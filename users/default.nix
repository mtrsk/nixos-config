{ config, lib, pkgs, ...}:

{
  imports = [
    ../modules/ipfs-daemon
    ../modules/home-manager
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
        # Utils
        polybar
      ]);
      shell = pkgs.zsh;
    };
  };

  services.home-manager = {
    enable = true;
    auto-update = {
      enable = true;
      user = "usul";
    };
  };
}
