{pkgs, ...}:

{
  home.packages = with pkgs; [
  ];

  programs.ranger = {
    enable = true;
    aliases = {
      e = "edit";
      q = "quit";
      qa = "quitall";
      f = "console fzf_filter%space";
    };
    settings = {
      preview_images = true;
      preview_images_method = "kitty";
      preview_files = true;
      preview_directories = true;
      vcs_aware = true;
      viewmode = "miller";
      draw_borders = "both";
      mouse_enabled = true;
      update_title = true;
      padding_right = false;
    };
    rifle = [
      {
        condition = "mime ^image";
        command = ''${pkgs.nsxiv}/bin/nsxiv -- "$@"'';
      }
      {
        condition = "mime ^text";
        command = ''nvim -nw -- "$@"'';
      }
      {
        condition = "ext pdf|djvu|epub";
        command = ''zathura -- "$@"'';
      }
      {
        condition = "ext mp4|m4v|mpv";
        command = ''mpv -- "$@"'';
      }
    ];
    extraPackages = with pkgs; [
      atool
      ffmpeg
      ffmpegthumbnailer
      highlight
      mediainfo
      poppler_utils
      zathura
    ];
  };

  #xdg.configFile = {
  #  "ranger" = {
  #    source = ../dotfiles/ranger;
  #    recursive = true;
  #  };
  #};
}
