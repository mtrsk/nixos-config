{lib, options, pkgs, config, modulesPath}:

let
  repo = "https://github.com/rycee/home-manager.git";
in
{
  systemd.timers.home-manager-update = {
    description = "Home-Manager Update Timer";
    wantedBy = [ "timers.target" ];
    partOf = [ "home-manager-update.service" ];
    timerConfig = {
      OnCalendar = "*-*-* 00:00:00";
    };
  };

  systemd.services.home-manager-update = {
    description = "Home-Manager Update Service";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "usul";
    };
    script = ''
      nix-prefetch-git ${repo} > ${builtins.toString ../overlays/home-manager/version.json}
    '';
  };

  systemd.services.home-manager-update.enable = true;
}


