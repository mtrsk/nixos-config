{config, lib, modulesPath, pkgs, options}:

with lib;

let
  cfg = config.services.ipfs-daemon;
in
{
  options.services.ipfs-daemon = {
    enable = mkEnableOption "Enables the ipfs deamon as a systemd service.";

    user = mkOption {
      type = types.str;
      default = "root";
      description = "Run the service as 'user'.";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.ipfs-daemon = {
      description = "IPFS Daemon";
      wantedBy = [ "default.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Type = "forking";
        User = cfg.user;
        ExecStart = "${pkgs.ipfs}/bin/ipfs daemon";
        ExecStop = "${pkgs.procps}/bin/pkill ipfs";
        Restart = "on-failure";
      };
    };
  };
}
