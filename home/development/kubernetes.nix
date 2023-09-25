{pkgs, ...}:

{
  home.packages = with pkgs; [
    argocd
    kind
    kompose
    kubectl
    kubernetes-helm
    k9s
  ];
}
