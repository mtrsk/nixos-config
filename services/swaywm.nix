{config, lib, pkgs, ...}:

{
  programs.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true;
    };
    extraPackages = with pkgs; [
      alacritty
      brightnessctl
      dmenu
      flashfocus
      grim
      kanshi
      mako
      slurp
      swaylock
      swayidle
      xwayland
      waybar
      wdisplays
      wofi
      wl-clipboard
      wf-recorder
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_PA_PLATAFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOW_DECORATION=1
      export _JAVA_AWT_WM_NONTRANSPARENTIG=1
      export MOZ_ENABLE_WAYLAND=1
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
    '';
  };

  systemd.user.targets.sway-session = {
    description = "Sway composotiro session";
    documentation = [ "man::systemd.special(7)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
  };

  systemd.user.services.kanshi = {
    description = "Kanshi output autoconfig";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    environment = {
      XGD_CONFIG_HOME="/home/leto/.config";
    };

    serviceConfig = {
      ExecStart = ''
      ${pkgs.kanshi}/bin/kanshi
      '';
      RestartSec = 5;
      Restart = "always";
    };
  };

  #systemd.user.services.swayidle = {
  #  description = "Idle Manager for Wayland";
  #  documentation = [ "man:swayidle(1)" ];
  #  wantedBy = [ "sway-session.target" ];
  #  partOf = [ "graphical-session.target" ];
  #  path = [ pkgs.bash ];
  #  serviceConfig = {
  #    ExecStart = '' ${pkgs.swayidle}/bin/swayidle -w -d \
  #      timeout 300 '${pkgs.sway}/bin/swaymsg "output * dpms off"' \
  #      resume '${pkgs.sway}/bin/swaymsg "output * dpms on"'
  #    '';
  #  };
  #};

  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "sway";
      gdm.enable = true;
    };
  };

  environment = {
    etc = {
      "sway/config".source = ../dotfiles/sway/config;
      "xdg/waybar/config".source = ../dotfiles/waybar/config;
      "xdg/waybar/styles.css".source = ../dotfiles/waybar/style.css;
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      gtkUsePortal = true;
    };
  };

  programs.waybar.enable = true;
}
