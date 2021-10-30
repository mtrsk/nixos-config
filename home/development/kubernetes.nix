{pkgs, ...}:

{
  home.packages = with pkgs; [
    argocd
    kubectl
    kubernetes-helm
  ];
}
