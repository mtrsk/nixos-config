{pkgs, ...}:

{
  home.packages = with pkgs; [
    awscli2
  ];
}
