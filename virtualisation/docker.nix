{config, lib, modulesPath, pkgs, options}:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = (with pkgs; [
    docker_compose
  ]);
}
