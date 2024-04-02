# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
  ];

  disabledModules = [
    "profiles/base.nix"
  ];

  sdImage = {
    compressImage = false;
    populateFirmwareCommands = "";
    postBuildCommands = ''
      dd if=${pkgs.ubootLibreTechCC}/u-boot.gxl.sd.bin of=$img conv=fsync,notrunc bs=512 seek=1 skip=1
      dd if=${pkgs.ubootLibreTechCC}/u-boot.gxl.sd.bin of=$img conv=fsync,notrunc bs=1 count=444
    '';
  };

  boot = {
    loader = {
      grub.enable = false;
      # Enables the generation of /boot/extlinux/extlinux.conf
      generic-extlinux-compatible.enable = true;
    };

    # necessary for libre computer board
    kernelParams = ["console=tty1" "console=ttyS2,1500000n8"];
    kernelPackages = pkgs.linuxPackages_latest;
  };
  boot.supportedFilesystems = lib.mkForce [ "btrfs" "ntfs" "vfat" ];

  services.zram-generator = {
    enable = true;
    settings.zram0 = {
      compression-algorithm = "zstd";
      zram-size = "ram * 2";
    };
  };

  networking = {
    hostName = "godel";
    useDHCP = true;
    interfaces.end0.useDHCP = true;

    firewall = {
      enable = true;
      # required for pihole
      allowedTCPPorts = [8085 80 53 67];
      allowedUDPPorts = [53 67 68 546 547];
      extraCommands = ''
        iptables -I INPUT 1 -p tcp -m tcp --dport 4711 -i lo -j ACCEPT
        iptables -I INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
      '';
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  nix = {
    gc.automatic = true;
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "23.11";
}
