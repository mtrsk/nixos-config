{pkgs, ...}:

{
  services.udiskie = {
    enable = true;
    notify = true;
    tray = "auto";
  };
}
