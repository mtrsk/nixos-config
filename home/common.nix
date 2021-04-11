{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    curl
    exiftool
    htop
    nix-prefetch-git
    pciutils    # lspci
    psmisc      # pkill, killall, pstree, fuser
    sshfs
    smartmontools
    tree
    unzip
    usbutils    # lsusb
    wget
  ];
}
