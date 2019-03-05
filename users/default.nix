{ config, lib, pkgs, ...}:

{
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
        # Deamons
        earlyoom
        # Libs
        poppler_utils
        djvulibre
        # Reading/RSS
        newsboat
        zathura
        # Browsing
        firefox
        qutebrowser
        tor
        tor-browser-bundle-bin
        # Utils
        gimp
        ranger
        transmission-gtk
        tomb
        tmate
        youtube-dl
        # Gaming
        discord
        #playonlinux
        steam
        # Chatting
        weechat
        tdesktop
        # Media
        feh
        ffmpegthumbnailer
        mpd
        mpv
        ncmpcpp
        # Rice
        conky
        neofetch
        polybar
        pywal
        # Development
        direnv
        heroku
        # Etc...
        arandr
        scrot
        xclip
      ]);
      shell = pkgs.zsh;
    };
  };
}
