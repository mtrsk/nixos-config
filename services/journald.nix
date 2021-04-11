{pkgs, config, ...}:

{
  services.journald.extraConfig = ''
    MaxRetentionSec=14day
  '';
}
