{pkgs, ...}:

{
  home.packages = with pkgs; [
    curl
    dig
    exiftool
    fd
    file
    ffmpeg
    flameshot
    htop
    gnumake
    jq
    kooha
    lsof
    nix-prefetch-git
    ouch
    parallel
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
