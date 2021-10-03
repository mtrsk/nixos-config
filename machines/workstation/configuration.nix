# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Services
      ../../services/compton.nix
      ../../services/fail2ban.nix
      ../../services/journald.nix
      ../../services/i3wm.nix
      ../../services/localization.nix
      ../../services/pulseaudio.nix

      # Virtualisation
      ../../virtualisation/docker.nix
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
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_5_13;

  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.cleanTmpDir = true;

  # Hardware

  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  # Nix/Nixpkgs

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Networking

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp8s0.useDHCP = true;

  networking.hostName = "caladan";
  networking.networkmanager.enable = true;

  networking.extraHosts = let
    version = "3.9.8";
    hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/${version}/alternates/porn/hosts";
    sha256 = "1wgjvn7knq8r3lpfkrlbxw3313f169wiacawx6y1ak9rx7axy0nl";
    hostsFile = builtins.fetchurl {
      url = hostsPath;
      sha256 = sha256;
    };
  in builtins.readFile "${hostsFile}";

  # Misc

  programs.bash.enableCompletion = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure X11
  services.xserver = {
    layout = "br";
    xkbOptions = "ctrl:nocaps";
    videoDrivers = [ "nvidia" ];
    dpi = 100;
    desktopManager.xterm.enable = false;
    displayManager.sddm.enable = true;
    displayManager.sessionCommands = ''
      xset s off
      xset -dpms
    '';
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    gnome3.adwaita-icon-theme
    gparted
    networkmanagerapplet
    stevenblack-blocklist
  ];

  # Programs
  programs.steam.enable = true;

  # Users

  # For Home-Manager's ZSH
  environment.pathsToLink = [
    "/share/zsh"
  ];

  users.users.leto = {
    isNormalUser = true;
    createHome = true;
    group = "leto";
    uid = 1000;
    extraGroups = [
      "wheel"
      "docker"
      "video"
      "audio"
      "disk"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };
  users.groups.leto.gid = 1000;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
