{config, ...}:

{
  services.compton = {
    enable = true;
    backend = "glx";
    shadow = true;
    activeOpacity = 0.95;
  };
}
