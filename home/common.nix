{pkgs, ...}:

{
  home.packages = with pkgs; [
    curl
    exiftool
    fd
    file
    ffmpeg
    flameshot
    htop
    gnumake
    jq
    lsof
    nix-prefetch-git
    ouch
    pciutils    # lspci
    psmisc      # pkill, killall, pstree, fuser
    ripgrep
    sshfs
    smartmontools
    transmission-qt
    tree
    tree-sitter
    unar
    unzip
    usbutils    # lsusb
    wget
    zip
  ];
}
