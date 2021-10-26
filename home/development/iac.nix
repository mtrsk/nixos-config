{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Dhall
    dhall
    dhall-json
    # Hashicorp
    nomad
    nomad-autoscaler
    packer
    terraform
    vault
    # Pulumi
    pulumi-bin
    # Terraform
    terracognita
  ];
}
