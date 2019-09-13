{config, lib, modulesPath, pkgs, options}:

with lib;

let
  repo = "https://github.com/rycee/home-manager.git";
  cmd = "${pkgs.nix-prefetch-git}/bin/nix-prefetch-git";

  cfg = config.services.home-manager;
in
{
  options.services.home-manager = {
    enable = mkEnableOption "Enables the home-manager service.";

    auto-update = mkOption {
      type = types.submodule {
        options = {

          enable = mkOption {
            type = types.bool;
            default = true;
            description = "Enables a systemd service to auto-update home-manager.";
          };

          user = mkOption {
            type = types.str;
            default = "root";
            description = "User to run the service as.";
          };

          timer = mkOption {
            type = types.str;
            default = "*-*-* 00:00:00";
            description = "Systemd Timer for when you should update your home-manager.";
          };

        };
      };
    };
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      home-manager
    ];

    systemd.timers.home-manager-update = {
      description = "Home-Manager Update Timer";
      wantedBy = [ "timers.target" ];
      partOf = [ "home-manager-update.service" ];
      timerConfig = {
        OnCalendar = cfg.auto-update.timer;
      };
    };

    systemd.services.home-manager-update = {
      description = "Home-Manager Update Service";
      after = [ "network.target" ];
      serviceConfig = {
        Type = "oneshot";
        User = cfg.auto-update.user;
      };
      script = ''
        ${cmd} ${repo} > ${builtins.toString ../overlays/home-manager/version.json}
      '';
    };

  };
}
