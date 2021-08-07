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
      ../../services/journald.nix
      ../../services/localization.nix

      # Virtualisation
      ../../virtualisation/docker.nix

      # Users
      ../../home/leto
    ];

  boot.initrd.luks.devices = {
    root = {
	  device = "/dev/sda2";
	  preLVM = true;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernel.sysctl = {
    "kernel.sysrq" = 128;
  };

  # Always pick the latest Kernel
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.cleanTmpDir = true;

  # Documentations

  documentation.dev.enable = true;

  # Hardware

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  # Nix/Nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp8s0.useDHCP = true;
  networking.hostName = "caladan";
  networking.networkmanager.enable = true;

  programs.bash.enableCompletion = true;

  fonts.fonts = with pkgs; [
    font-awesome_5
    jetbrains-mono
    powerline-fonts
    symbola
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbOptions = "ctrl:nocaps";
    videoDrivers = [ "nvidia" ];
    # Desktop Manager Config
    desktopManager.xterm.enable = false;
    # Display Manager
    displayManager.sddm.enable = true;
    #displayManager.autoLogin.user = "usul";
    displayManager.sessionCommands = ''
      xset s off
      xset -dpms
    '';
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    networkmanagerapplet
    # Gnome
    gnome3.adwaita-icon-theme
  ];

  # Programs
  programs.steam.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}

