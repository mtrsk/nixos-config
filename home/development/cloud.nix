{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    # Cloud-provider CLIs
    awscli
    azure-cli
    azure-storage-azcopy
    heroku
    oci-cli
    # Firecracker Micro-VM
    firecracker
    firectl
  ];
}
