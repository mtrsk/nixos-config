{pkgs, home, user, ...}:

let
  dotfiles = ../dotfiles;
  # Convert a string to dotfiles path format
  dpath = p: builtins.toString "${dotfiles}/${p}";
in
{
  home.packages = with pkgs; [
    conky
    dmenu
    i3lock-fancy
    neofetch
    pywal
  ];

  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile "${dotfiles}/polybar/config";
    package = pkgs.polybarFull;
    script = builtins.readFile "${dotfiles}/polybar/launch.sh";
  };

  xdg.configFile = {
    "i3/config".text = import "${dotfiles}/i3wm/config.nix" {
      user=user;
      inherit pkgs;
    };
  };

  home.sessionVariables = {
    SPACESHIP_EXIT_CODE_SHOW = "true";
  };
}
