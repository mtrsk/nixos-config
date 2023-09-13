# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  #kbdLayout = "us";
  kbdLayout = "br(thinkpad)";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Services
      #../../services/fail2ban.nix
      #../../services/journald.nix
      ../../services/swaywm.nix
      ../../services/localization.nix
      ../../services/pipewire.nix

      # Virtualisation
      ../../virtualisation/docker.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/nvme0n1p2";
      preLVM = true;
    };
  };

  boot.kernel.sysctl = {
    "kernel.sysrq" = 128;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
   '';
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Fortaleza";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  networking.hostName = "arrakis";
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  console.useXkbConfig = true;

  # Until I fix screen sharing
  #services.xserver.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    layout = kbdLayout;
    xkbOptions = "ctrl:nocaps";
    videoDrivers = ["intel"];
    libinput.enable = true;
  };

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;


  # Hardware
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.leto.gid = 1000;
  users.users.leto = {
    createHome = true;
    isNormalUser = true;
    group = "leto";
    uid = 1000;
    extraGroups = [
     "audio"
     "disk"
     "docker"
     "input"
     "networkmanager"
     "tty"
     "video"
     "wheel"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    networkmanagerapplet
    #openvpn3
    #networkmanager-openvpn
    #gnome.networkmanager-openvpn
  ];

  environment.sessionVariables = {
    "XKB_DEFAULT_LAYOUT" = "${kbdLayout}";
  };

  # https://nix-community.github.io/home-manager/options.html#opt-programs.zsh.enableCompletion
  environment.pathsToLink = [ "/share/zsh" ];

  # List services that you want to enable:

  # Programs
  programs.steam.enable = true;
  programs.nm-applet.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}

