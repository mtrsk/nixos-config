{pkgs, ...}:

{
  home.packages = with pkgs; [
    curl
    croc
    dig
    exiftool
    fd
    file
    ffmpeg
    flameshot
    graphviz
    gnumake
    htop
    jq
    kooha
    lsof
    neofetch
    nix-prefetch-git
    parallel
    pavucontrol
    #pinentry
    pinentry-curses
    pciutils    # lspci
    psmisc      # pkill, killall, pstree, fuser
    ripgrep
    sshfs
    smartmontools
    #transmission_4-qt
    qbittorrent-qt5
    tree
    tree-sitter
    unar
    unzip
    usbutils    # lsusb
    wget
    xclip
    zip
  ];
}
