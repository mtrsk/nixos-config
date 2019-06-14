{pkgs, config, ...}:

{
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull.override {
		x11Support = true;
      	jackaudioSupport = true;
		zeroconfSupport = true;
    };
  };

  environment.systemPackages = with pkgs; [
	flac
    pavucontrol
  ];
}
