{ pkgs, lib, config, ... }:

let
  startup = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.swww}/bin/swww init &
    ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &

    systemctl --user import-environment PATH &
    systemctl --user restart xdg-desktop-portal.service &

    sleep 2

    ${pkgs.swww}/bin/swww img ${../../assets/wallpaper.png} &
  '';

  defaultBinds = [
    "$mainMod, return, exec, kitty"
    "$mainMod, Q, killactive,"
    "$mainMod SHIFT, M, exit,"
    "$mainMod SHIFT, F, togglefloating,"
    "$mainMod, F, fullscreen,"
    "$mainMod, G, togglegroup,"
    "$mainMod, bracketleft, changegroupactive, b"
    "$mainMod, bracketright, changegroupactive, f"
    "$mainMod, O, exec, wofi --show drun"
    "$mainMod, P, pin, active"

    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"

    "$mainMod, h, movefocus, l"
    "$mainMod, l, movefocus, r"
    "$mainMod, k, movefocus, u"
    "$mainMod, j, movefocus, d"

    "$mainMod, b, exec, brave"
    ", Print, exec, grimblast copy area"
  ];

  workspaces = [
    # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
    builtins.concatLists (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in [
          "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
          "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]
      )
      10)
  ];
in
{
  home.packages = with pkgs; [
    dunst
    grim
    slurp
    wl-clipboard

    swww

    networkmanagerapplet

    wofi

    waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
    ];

    settings = {
      "$mainMod" = "SUPER";

      #bind = defaultBinds ++ workspaces;
      bind = defaultBinds;

      "plugin:borders-plus-plus" = {
        add_borders = 1; # 0 - 9

        # you can add up to 9 borders
        "col.border_1" = "rgb(ffffff)";
        "col.border_2" = "rgb(2222ff)";

        # -1 means "default" as in the one defined in general:border_size
        border_size_1 = 10;
        border_size_2 = -1;

        # makes outer edges match rounding of the parent. Turn on / off to better understand. Default = on.
        natural_rounding = "yes";
      };

      exec-once = [
        "${pkgs.bash}/bin/bash ${startup}/bin/start"
      ];
    };
  };
}
