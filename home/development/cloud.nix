{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Cloud-provider CLIs
    awscli
    heroku
    # Databases
    # dbeaver
    # Firecracker Micro-VM
    firecracker
    firectl
  ];
}
