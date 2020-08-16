{config, lib, modulesPath, pkgs, options}:

{
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      dates = "weekly";
      enable = true;
      flags = [ "--all" ];
    };
  };

  environment.systemPackages = (with pkgs; [
    docker_compose
  ]);
}
