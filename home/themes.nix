{ pkgs, stylix, ... }:

{
  stylix.targets = {
    waybar.enable = true;
    wofi.enable = true;
    neovim.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
  };

  home.packages = with pkgs; [
  ];
}
