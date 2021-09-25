{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    # Hashicorp
    nomad
    nomad-autoscaler
    packer
    terraform
    vault
    # Pulumi
    pulumi-bin
  ];
}
