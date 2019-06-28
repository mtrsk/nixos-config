{lib, options, pkgs, config, modulesPath}:

let
  repo = "https://github.com/rycee/home-manager.git";
  cmd = "${pkgs.nix-prefetch-git}/bin/nix-prefetch-git";
in
{
  systemd.timers.home-manager-update = {
    description = "Home-Manager Update Timer";
    wantedBy = [ "timers.target" ];
    partOf = [ "home-manager-update.service" ];
    timerConfig = {
      OnCalendar = "*-*-* 23:01:00";
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
      ${cmd} ${repo} > ${builtins.toString ../overlays/home-manager/version.json}
    '';
  };

  systemd.services.home-manager-update.enable = true;
}


