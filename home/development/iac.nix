{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Dhall
    dhall
    dhall-json
    # Hashicorp
    kbst
    nomad
    nomad-autoscaler
    packer
    terraform
    vault
    # Pulumi
    # pulumi-bin
    # Terraform
    terracognita
  ];
}
