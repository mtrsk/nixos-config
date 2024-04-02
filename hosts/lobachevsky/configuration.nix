{
  lib,
  modulesPath,
  pkgs,
  ...
}:

{
  imports = [
    ./sd-image.nix
  ];

  disabledModules = [
    "${modulesPath}/profiles/base.nix"
    "${modulesPath}/profiles/all-hardware.nix"
  ];

  sdImage = {
    compressImage = false;
    imageName = "pi.img";

    extraFirmwareConfig = {
      # Give up VRAM for more Free System Memory
      # - Disable camera which automatically reserves 128MB VRAM
      start_x = 0;

      # Reduce allocation of VRAM to 16MB minimum for non-rotated
      # (32MB for rotated)
      gpu_mem = 16;

      # Configure display to 800x600 so it fits on most screens
      # * See: https://elinux.org/RPi_Configuration
      hdmi_group = 2;
      hdmi_mode = 8;
    };
  };

  boot = {
    initrd.availableKernelModules = [
      "usbhid"
      "usb_storage"
    ];

    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
      timeout = 2;
    };

    kernelPackages = pkgs.linuxPackages_latest;

    # https://artemis.sh/2023/06/06/cross-compile-nixos-for-great-good.html
    # for deploy-rs
    # binfmt.emulatedSystems = [ "x86_64-linux" ];

    # Avoids warning: mdadm: Neither MAILADDR nor PROGRAM has been set.
    # This will cause the `mdmon` service to crash.
    # See: https://github.com/NixOS/nixpkgs/issues/254807
    swraid.enable = lib.mkForce false;
  };

  # Keep this to make sure wifi works
  hardware = {
    enableRedistributableFirmware = lib.mkForce false;
    firmware = [pkgs.raspberrypiWirelessFirmware];
  };

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnsupportedSystem = true;
    config.allowBroken = true;
    hostPlatform.system = "aarch64-linux";
    buildPlatform.system = "x86_64-linux";
  };

  nix = {
    settings.trusted-users = [ "@wheel" ];
    gc.automatic = true;
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  networking.hostName = "lobachevsky";
  networking = {
    useDHCP = true;
    wireless = {
      enable = true;
      interfaces = ["wlan0"];
    };
  };

  documentation.nixos.enable = false;

  services.zram-generator = {
    enable = true;
    settings.zram0 = {
      compression-algorithm = "zstd";
      zram-size = "ram * 2";
    };
  };

  # https://raspberrypi.stackexchange.com/questions/40105/access-gpio-pins-without-root-no-access-to-dev-mem-try-running-as-root
  services.udev.extraRules = ''
    KERNEL=="gpiomem", GROUP="gpio", MODE="0660"
    SUBSYSTEM=="gpio", KERNEL=="gpiochip*", ACTION=="add", PROGRAM="${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/chgrp -R gpio /sys/class/gpio && ${pkgs.coreutils}/bin/chmod -R g=u /sys/class/gpio'"
    SUBSYSTEM=="gpio", ACTION=="add", PROGRAM="${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/chgrp -R gpio /sys%p && ${pkgs.coreutils}/bin/chmod -R g=u /sys%p'"
  '';
  services.getty.autologinUser = "mbenevides";
  # Enable OpenSSH out of the box.
  #services.sshd.enable = true;
  # NTP time sync.
  #services.timesyncd.enable = true;

  users.groups.gpio = {};
  users.users.mbenevides = {
    isNormalUser = true;
    home = "/home/mbenevides";
    description = "Marcos Benevides";
    extraGroups = ["wheel" "networkmanager" "gpio" "audio"];
    openssh = {
      authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKStRI4iiTc6nTPKc0SPjHq79psNR5q733InvuHFAT0BHIiKWmDHeLS5jCep/MMrKa1w9qCt3bAnJVyu33+oqISx/5PzDBikiBBtBD6irovJx9dVvkjWkQLcbZwcStUfn6HFjyWdUb1jZqzQMf3JWeIj3RgP8nKwDatHSVB0GkvSETBiJ+bfbGKK1bacusqfsiN3b2niytDgnWMtKB4tMgvGUn5AEqRBtI5zDrnPU1T7edDCjI32QLBln/HlcfAHz+avN4YsW7iTWu25N/MSOQwBrKHLEQviGq9/j3Wu1pzxV2n2m32uUATFEKLf3sLCdsOWm1r+HlsXOcukUZnRhLc9O2ZVoWtDHo72iOzVY6rlRBoHvoUxw6A8k/jZWb1ospvjOLsjZuAZaDSjcE6iM0nXQSdhgGPSgeCTofOgteYoovA4XlK4aNomuTI3OPLr9P9SLC0qJHidvLIGQYWyMiwdeDJESbY2PFUNCi5VffwEUPYh8sp3E8EwjGDvSCygu4fU7vqaOi3OEziwg2ff89CdVr7k606LYmRF3dR+12Cp6XBOgUoaz+OzGn0Sr9HXw3GiF9xH/e1PL6mHwUT2NARB/mI64uY9JAi0/hrwkQsiIx1tf63qUDz/je9gk53wP7/GfWNoIeEkRzCz0QkEnxcMEoLjbTk56JFkmP0fpHDQ== (none)"
      ];
    };
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  programs.gnupg.agent.enable = false;

  #environment.systemPackages = with pkgs; [
  #  htop
  #  vim
  #  git
  #  lsof
  #  dig
  #  tree
  #  bintools
  #  file
  #  ethtool
  #];

  system.stateVersion = "24.05";
}
