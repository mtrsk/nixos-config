# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  json = builtins.fromJSON (builtins.readFile ./config.json);
  nixos_user = json.user;
  nixos_machine = json.machine;
  extra_config = {
    home_manager_branch = "release-21.05";
    machines = {
      workstation = {
        config_path = user: "/home/${user}/NixOS/machines/workstation";
        default_user = "leto";
        network_card = "enp8s0";
      };
    };
  };
  machine = builtins.getAttr nixos_machine extra_config.machines;
  path = machine.config_path nixos_user;
in
{
  imports =
    [
      ./documentation.nix
      ./fonts.nix
      "${path}/configuration.nix"
    ];
}
