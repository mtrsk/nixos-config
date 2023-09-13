{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Cloud-provider CLIs
    awscli2
    flyctl
    # Databases
    dbeaver
    # Firecracker Micro-VM
    firecracker
    firectl
  ];
}
