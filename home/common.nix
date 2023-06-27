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
    graphviz
    gnumake
    htop
    jq
    kooha
    lsof
    magic-wormhole
    nix-prefetch-git
    ouch
    parallel
    pinentry
    pinentry-curses
    pciutils    # lspci
    psmisc      # pkill, killall, pstree, fuser
    ripgrep
    sshfs
    smartmontools
    #transmission-qt
    tree
    tree-sitter
    unar
    unzip
    usbutils    # lsusb
    wget
    yt-dlp
    xclip
    zip
  ];
}
