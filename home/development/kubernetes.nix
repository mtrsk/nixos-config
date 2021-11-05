{pkgs, ...}:

{
  home.packages = with pkgs; [
    argocd
    kompose
    kubectl
    kubernetes-helm
  ];
}
