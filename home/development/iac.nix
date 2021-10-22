{pkgs, ...}:

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
    # Terraform
    terracognita
  ];
}
