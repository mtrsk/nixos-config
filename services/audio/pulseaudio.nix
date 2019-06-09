{pkgs, config, ...}:

{
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudio.override {
      jackaudioSupport = true;
    };
  };

  environment.systemPackages = with pkgs; [
    flac
    pavucontrol
  ];
}
