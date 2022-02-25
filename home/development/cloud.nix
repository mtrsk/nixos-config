{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Cloud-provider CLIs
    awscli
    azure-cli
    azure-storage-azcopy
    heroku
    # Databases
    dbeaver
    # Firecracker Micro-VM
    firecracker
    firectl
  ];
}
