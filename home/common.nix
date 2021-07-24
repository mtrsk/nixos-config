{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    curl
    exiftool
    file
    ffmpeg
    htop
    gnumake
    jq
    nix-prefetch-git
    pciutils    # lspci
    psmisc      # pkill, killall, pstree, fuser
    sshfs
    smartmontools
    tree
    unar
    unzip
    usbutils    # lsusb
    scrot
    wget
    zip
  ];
}
