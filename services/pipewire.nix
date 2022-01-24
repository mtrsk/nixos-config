{pkgs, config, ...}:

{
  environment.systemPackages = with pkgs; [
	flac
    pavucontrol
  ];

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
