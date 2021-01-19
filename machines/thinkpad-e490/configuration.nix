# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Services
      ../../services/fail2ban.nix
      # ../../services/openssh.nix

      # Virtualisation
      ../../virtualisation/docker.nix
      #../../virtualisation/lxc.nix
      #../../virtualisation/libvirtd.nix
      ../../virtualisation/podman.nix

      # Users
      ../../home/usul
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernel.sysctl = {
    "kernel.sysrq" = 128;
  };

  boot.cleanTmpDir = true;

  # Always pick the latest stable Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # LUKS config
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/sda2";
      preLVM = true;
    };
  };

  boot = {
    kernelModules = [
      "acpi_call"
      "amdgpu"
      "coretemp"
      "iwlwifi"
    ];
    # extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };

  boot.blacklistedKernelModules = [ "bluetooth" ];

  # ++++++++++++++++++++++++++++++++ #
  # ||          Hardware          || #
  # ++++++++++++++++++++++++++++++++ #

  # Intel
  hardware.cpu.intel.updateMicrocode = true;

  #hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  # Disable Bluetooth
  hardware.bluetooth.enable = false;

  # OpenGL
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.opengl.extraPackages = with pkgs; [
     amdvlk
  ];
  # For 32 bit applications
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  # ++++++++++++++++++++++++++++++++ #
  # ||         Networking         || #
  # ++++++++++++++++++++++++++++++++ #

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp5s0.useDHCP = true;

  networking.enableIPv6 = false;

  # networking.wireless.enable = true;
  # networking.wireless.networks = {
  #     AP_NAME = { psk = "PSK_PASSWD" };
  # };

  networking.networkmanager.enable = true;
  networking.hostName = "arrakis";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # ++++++++++++++++++++++++++++++++ #
  # ||           NixPkgs          || #
  # ++++++++++++++++++++++++++++++++ #

  # Nixpkgs Configuration
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "*-*-* 23:00:00";
      options = "--delete-older-than 3d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Adding NUR
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  nix.trustedUsers = [ "root" "usul" ];

  # ++++++++++++++++++++++++++++++++ #
  # ||        Environment         || #
  # ++++++++++++++++++++++++++++++++ #

  documentation.dev.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  #programs.dconf.enable = true;
  #services.dbus.packages = [ pkgs.gnome3.dconf ];

  programs.dconf.enable = true;

  environment = {
    systemPackages = (with pkgs; [
      bind
      curl
      exiftool
      file
      glxinfo
      gnumake
      gparted
      haveged
      htop
      iotop
      libpcap     # tcpdump
      libnotify
      lm_sensors
      lsd
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
      unzip
      zip
      # Security
      dirb
      lynis
      # Terminal Emulators
      kitty
      # Gnome
      gnome3.adwaita-icon-theme
    ]);
  };

  programs.bash.enableCompletion = true;

  fonts.fonts = with pkgs; [
    font-awesome_5
	jetbrains-mono
    powerline-fonts
    symbola
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  services.earlyoom.enable = true;

  services.journald.extraConfig = ''
    MaxRetentionSec=14day
  '';

  services.xserver = {
    layout = "br";
    xkbModel = "thinkpad60";
    xkbOptions = "terminate:ctrl_alt_bksp";
  };

  # AMD
  # boot.kernelParams = [ "amd_iommu=pt" "ivrs_ioapic[32]=00:14.0" "iommu=soft" ];

  # Xserver
  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [
      "amdgpu"
      "intel"
    ];
    # Enable touchpad support.
    libinput = {
      enable = true;
    };
    # Desktop Manager Config
    desktopManager.xterm.enable = false;
    # Display Manager
    displayManager.sddm.enable = true;
    #displayManager.autoLogin.user = "usul";
    displayManager.sessionCommands = ''
      xset s off
      xset -dpms

      wal -R
    '';
  };

  services.clamav = {
    daemon.enable = false;
    updater = {
      enable = false;
      interval = "daily";
    };
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}

