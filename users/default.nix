{ config, lib, pkgs, ...}:

{
  imports = [
    ../systemd/ipfs-service.nix
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
        bind
        # Deamons
        earlyoom
        # Libs
        poppler_utils
        djvulibre
        # Reading/RSS
        newsboat
        zathura
        # Browsing
        #firefox
        # Utils
        gimp
        ranger
        transmission-gtk
        #tomb
        tmate
        youtube-dl
        # Gaming
        discord
        steam
        retroarch
        # Chatting
        weechat
        tdesktop
        # Development
        direnv
        heroku
        ipfs
        # Etc...
        arandr
        scrot
        xclip
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
