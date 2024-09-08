{pkgs, ...}:

{
  home.packages = with pkgs; [
    awscli2
    kubectl
    heroku
  ];
}
