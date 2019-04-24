{lib, options, pkgs, config, ...}:

{
  systemd.services.ipfs-daemon = {
    description = "IPFS Daemon";
    wantedBy = [ "default.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "forking";
      User = "usul";
      ExecStart = "${pkgs.ipfs}/bin/ipfs daemon";
      ExecStop = "${pkgs.procps}/bin/pkill ipfs";
      Restart = "on-failure";
    };
  };

  systemd.services.ipfs-daemon.enable = true;
}
