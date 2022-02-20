{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Cloud-provider CLIs
    awscli
    azure-cli
    azure-storage-azcopy
    heroku
    # Firecracker Micro-VM
    firecracker
    firectl
  ];
}
