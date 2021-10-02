{config, lib, pkgs, ...}:

{
  services.xserver.windowManager = {
    i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3lock-fancy
      ];
    };
  };
  services.xserver.displayManager.defaultSession = "none+i3";
}
