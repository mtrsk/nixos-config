{pkgs, ...}:

{
  services.udiskie = {
    enable = true;
    notify = true;
    automount = true;
    tray = "auto";
  };
}
