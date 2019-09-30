{config, ...}:

{
  services.compton = {
    enable = true;
    backend = "glx";
    shadow = true;
    opacityRules = [
      "95:class_g = 'kitty' && focused"
      "10:class_g = 'kitty' && !focused"
      "95:class_g = 'Alacritty' && focused"
      "10:class_g = 'Alacritty' && !focused"
    ];
  };
}
