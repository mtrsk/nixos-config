{home, pkgs, ...}:

{
  services.udiskie = {
    enable = true;
    notify = false;
    tray = "always";
  };
}
