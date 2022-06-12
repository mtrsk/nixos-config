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
    # Nix
    morph
    # Pulumi
    pulumi-bin
    # Terraform
    terracognita
  ];
}
