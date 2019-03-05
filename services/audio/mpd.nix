{config, lib, pkgs, ...}:

let
  user = "usul";
  home = "/home/${user}";
  mpd_port = 6600;
  mpd_files = "${home}/.mpd";
in
{
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
    systemWide = true;
  };

  environment.systemPackages = with pkgs; [
    flac
    pavucontrol
  ];

  services.mpd = {
    enable = true;
    user = "${user}";
    group = "${user}";
    musicDirectory = "${home}/Music";
    dataDir = "${mpd_files}";
	dbFile = "${mpd_files}/tag_cache";
    playlistDirectory = "${mpd_files}/playlists";
    network.port = mpd_port;
    network.listenAddress = "127.0.0.1";
    extraConfig = ''
      #pid_file "${mpd_files}/mpd.pid"
      #state_file "${mpd_files}/mpdstate"

      audio_output {
        type      "pulse"
        name      "Local Music Player Daemon"
      }

      audio_output {
        type      "fifo"
        name      "my_fifo"
        path      "/tmp/mpd.fifo"
        format    "44100:16:2"
      }
    '';
  };
}
