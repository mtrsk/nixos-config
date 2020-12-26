{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    steam
	steam-run
  ];
}
