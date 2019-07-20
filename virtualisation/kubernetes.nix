{config, lib, modulesPath, pkgs, options}:

{
  services.kubernetes = {
    roles = ["master" "node"];
    masterAddress = "localhost";
  };
}
