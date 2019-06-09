{ config, lib, pkgs, ...}:

{
  imports = [
    ../systemd/ipfs-service.nix
    ../services/audio/pulseaudio.nix
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
        # Deamons
        earlyoom
        # Libs
        poppler_utils
        djvulibre
        # Utils
        ranger
        tomb
        tmate
        youtube-dl
        # Rice
        conky
        neofetch
        polybar
        pywal
      ]);
      shell = pkgs.zsh;
    };
  };
}
