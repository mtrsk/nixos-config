{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    kubectl
  ];
}
