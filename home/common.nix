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
    transmission-qt
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
