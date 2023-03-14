{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Cloud-provider CLIs
    awscli2
    heroku
    # Databases
    # dbeaver
    # Firecracker Micro-VM
    firecracker
    firectl
  ];
}
