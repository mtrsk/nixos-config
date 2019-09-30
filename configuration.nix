# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Programs
      ./programs/ssh.nix

      # Services
      ./services/fail2ban.nix
      ./services/openssh.nix

      # Virtualisation
      ./virtualisation/docker.nix
      ./virtualisation/libvirtd.nix

      # Shared
      ./users/usul
    ];

  # Use the systemd-boot EFI boot loader.
  boot.kernelModules = [
    "coretemp"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.blacklistedKernelModules = [
    "bluetooth"
  ];

  # Define which partition is encrypted with LUKS
  boot.initrd.luks.devices = [
    {
      name = "ROOT";
      device = "/dev/sda2";
      preLVM = true;
    }
  ];

  boot.cleanTmpDir = true;

  # ++++++++++++++++++++++++++++++++ #
  # ||          Hardware          || #
  # ++++++++++++++++++++++++++++++++ #

  # Intel
  hardware.cpu.intel.updateMicrocode = true;

  # Disable Bluetooth
  hardware.bluetooth.enable = false;

  # Nvidia
  hardware.nvidia = {
    modesetting.enable = true;
    optimus_prime = {
      enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:9:0:0";
    };
  };

  # OpenGL
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  # ++++++++++++++++++++++++++++++++ #
  # ||         Networking         || #
  # ++++++++++++++++++++++++++++++++ #

  # Network

  networking.hostName = "corecursion"; # Define your hostname.
  networking.networkmanager.enable = true;

  # ++++++++++++++++++++++++++++++++ #
  # ||           NixPkgs          || #
  # ++++++++++++++++++++++++++++++++ #

  # Nixpkgs Configuration

  nix.gc = {
    automatic = true;
    dates = "*-*-* 23:00:00";
    options = "--delete-older-than 3d";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nixpkgs.overlays = [
    (import ./overlays/conky.nix)
    (import ./overlays/ncmpcpp.nix)
    (import ./overlays/nvim/neovim.nix)
    (import ./overlays/polybar.nix)
  ];

  # ++++++++++++++++++++++++++++++++ #
  # ||        Environment         || #
  # ++++++++++++++++++++++++++++++++ #

  documentation.dev.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  programs.dconf.enable = true;
  services.dbus.packages = [ pkgs.gnome3.dconf ];

  environment = {
    systemPackages = (with pkgs; [
      bind
      curl
      dmenu
      exiftool
      file
      git
      glxinfo
      gnumake
      gnupg
      gparted
      haveged
      htop
      jq
      libpcap     # tcpdump
      libnotify
      lm_sensors
      lshw
      lsof
      man
      man-pages
      mtr
      ncat        # nmap
      networkmanagerapplet
      nix-prefetch-git
      openssl
      pciutils    # lspci
      psmisc      # pkill, killall, pstree, fuser
      sshfs
      smartmontools
      tree
      usbutils    # lsusb
      xorg.xmodmap
      xorg.xev
      wget
      # Unzip
      p7zip
      unzip
      zip
      # Text Editors
      emacs
      neovim
      # Security
      dirb
      lynis
      pass
      pwgen
      # Terminal Emulators
      kitty
    ]);

    # Environment Variables
    variables.EDITOR = "vim";
  };

  programs.bash.enableCompletion = true;

  fonts.fonts = with pkgs; [
    font-awesome_5
    fira-code
    fira-code-symbols
    monoid
    powerline-fonts
    symbola
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  # Make vim the default editor using the EDITOR environment variable.
  # programs.vim.defaultEditor = true;

  # List services that you want to enable:

  # SSH-Agent
  programs.ssh.startAgent = true;

  # GPG-Agent
  programs.gnupg.agent.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Xserver
  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [
      "nvidia"
    ];
    # Enable touchpad support.
    libinput = {
      enable = true;
    };
    # Desktop Manager Config
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    # Display Manager
    displayManager.sddm.enable = true;
    displayManager.sddm.autoLogin.user = "usul";
    displayManager.sessionCommands = ''
      xset s off
      xset -dpms

      wal -R
    '';
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  systemd.extraConfig = "DefaultLimitNOFILE=1048576";

  security.pam.loginLimits = [{
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "1048576";
  }];

  # ++++++++++++++++++++++++++++++++ #

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}
