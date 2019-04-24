{config, pkgs, ...}:

{
  services.dnscrypt-proxy = {
    enable = true;
    # the official default resolver is unreliable from time to time
    # either use a different, trust-worthy one from here:
    #   https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv
    # or setup your own.
    resolverName = "cloudflare";
  };

  networking.nameservers = [
    "127.0.0.1"
  ];
}
