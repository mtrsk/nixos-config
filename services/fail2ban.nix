{config, ...}:

{
  services.fail2ban = {
    enable = true;
    jails.DEFAULT = ''
      bantime = 3600
    '';
    jails.ssh = ''
      filter = sshd
      maxretry = 4
      action = iptables[name=ssh, port=ssh, protocol=tcp]
      enabled = true
    '';
  };
}
