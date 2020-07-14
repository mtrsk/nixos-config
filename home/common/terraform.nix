{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    terraform
    # Providers
	terraform-providers.aws
	terraform-providers.docker
  ];
}
