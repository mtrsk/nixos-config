{pkgs, ...}:

{
  home.packages = with pkgs; [
    curl
    exiftool
    fd
    file
    ffmpeg
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
    tree
    tree-sitter
    unar
    unzip
    usbutils    # lsusb
    scrot
    wget
    zip
  ];
}
