{pkgs, home, ...}:

{
  manual.manpages.enable = true;


  nixpkgs.config = {
    allowUnfree = true;
    nix.useSandbox = true;
  };

  nixpkgs.overlays = [
    (import ../../overlays/conky.nix)
    (import ../../overlays/ncmpcpp.nix)
    (import ../../overlays/nvim/neovim.nix)
    (import ../../overlays/polybar.nix)
  ];

  home.packages = with pkgs; [
    arandr
    scrot
    tomb
    tmate
    shellcheck
    xclip
    # Daemons
    ipfs
    earlyoom
    # Development
    aws
    dbeaver
    dotnet-sdk
    google-cloud-sdk
    heroku
    postman
    siege
    travis
    vscodium
    # Chat
    weechat
    tdesktop
    zoom-us
    # Graphics/Design
    gimp
    krita
    # i3-related
    dmenu
    i3lock-fancy
    # Libs
    poppler_utils
    djvulibre
    # Media
    feh
    ffmpegthumbnailer
    mpv
    ncmpcpp
    # Torrents
    transmission-gtk
    # Gaming
    discord
    #lutris
    #retroarch
    steam
    # Utils
    youtube-dl
    ranger
    # Rice
    conky
    neofetch
    pywal
    # Tools
    alacritty
    shellcheck
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
  };

  programs.newsboat = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
      plugins = [
        "command-not-found"
        "docker"
        "docker-compose"
        "heroku"
        "vi-mode"
      ];
    };
    shellAliases = {
      icat="kitty +kitten icat";
      hstat="curl -o /dev/null --silent --head --write-out '%{http_code}\n' $1";
      ls="ls -h --group-directories-first --color=auto";
      la="ls -lAh --group-directories-first --color=auto";
      r="ranger";
      stow="stow -v";
      svim="sudo vim";
      xcc="xclip -sel clipboard";
    };
    history = {
      size = 5000;
      ignoreDups = true;
    };
    initExtra = builtins.readFile ./dotfiles/zsh/zshrc;
  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    customPaneNavigationAndResize = true;
    historyLimit = 5000;
    keyMode = "vi";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-boot 'on'
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '0'
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-save-shell-history 'on'
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
    ];
  };

  programs.zathura = {
    enable = true;
  };

  services.mpd = {
    enable = true;
    dataDir = builtins.toPath "/home/usul/.mpd";
    musicDirectory = builtins.toPath "/home/usul/Music";
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };
    extraConfig = ''
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

  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ./dotfiles/polybar/polybarc;
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      alsaSupport = true;
    };
    script = builtins.readFile ./dotfiles/polybar/polybar-launch.sh;
  };

  # Dotfiles
  xdg.configFile = {
    "conky/conkyrc".source = "${builtins.toString ./dotfiles/conky/conkyrc}";
    "kitty/kitty.conf".source = "${builtins.toString ./dotfiles/kitty/kitty.conf}";
    "i3/config".text = import ./dotfiles/i3wm/config.nix {};
  };
}
