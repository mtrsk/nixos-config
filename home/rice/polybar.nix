{ pkgs, colorscheme, ... }:

{
  programs.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
    };

    config = {
      "bar/top" = {
        monitor = "\${env:MONITOR:eDP1}";
        width = "100%";
        height = 27;
        fixed-center = true;

        background = "${colors.background}";
        foreground = "${colors.foreground}";
        line-color = "${colors.color07}";
        border-color = "${colors.background}";

        line-size = 2;
        border-size = 0;
        padding-left = 2;
        padding-right = 2;

        module-margin-left = 1;
        module-margin-right = 1;

        font-0 = "hack:pixelsize=10;1";
        font-1 = "Font Awesome 5 Free:style=Regular:pixelsize=8;1";
        font-2 = "Font Awesome 5 Free Solid:style=Solid:pixelsize=8;1";
        font-3 = "Font Awesome 5 Brands Regular:style=Regular:pixelsize=8;1";

        modules-left = "i3";
        modules-center = "date";
        modules-right = "mpd wired-network wireless-network pulseaudio battery xkeyboard";

        tray-position = "right";
        tray-padding = 2;

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = "true";
        strip-wsnumbers = "true";
        index-sort = "true";
        enable-click = "true";
        enable-scroll = "false";
        wrapping-scroll = "false";
        reverse-scroll = "false";
        fuzzy-match = "true";
        format = "<label-state> <label-mode>";
        label-mode = "%mode%";
        label-mode-padding = "1";
        label-mode-background = "${colors.foreground}";
        label-focused = "%name%";
        label-focused-foreground = "${colors.background}";
        label-focused-background = "${colors.foreground}";
        label-focused-underline = "${colors.color02}";
        label-focused-padding = "1";
        label-unfocused = "%name%";
        label-unfocused-padding = "1";
        label-visible = "%index% %name%";
        label-visible-underline = "${colors.foreground}";
        label-visible-padding = "2";
        label-urgent = "%name%";
        label-urgent-foreground = "${colors.color09}";
        label-urgent-background = "${colors.background}";
        label-urgent-padding = "1";
      };
    };
  };
}
