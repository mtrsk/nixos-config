{ pkgs, config, ... }:

let
  # hyprpaper
  path = ../wallpapers;
  files = builtins.attrNames (builtins.readDir path);
  format = (p: builtins.concatStringsSep "/" [(builtins.toString path) p]);
  wallpapers = map format files;

  # waybar
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = wallpapers;
    };
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        modules-left = [
          "custom/startmenu"
          "hyprland/window"
          "idle_inhibitor"
        ];
        modules-right = [
          "custom/notification"
          "network"
          "battery"
          "pulseaudio"
          "cpu"
          "memory"
          "tray"
          "custom/exit"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            active = "";
            default = "";
            urgent = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "clock" = {
          format = "  {:L%H:%M}";
          interval = "60";
          format-alt = "  {%d/%m/%y}";
          tooltip = true;
          tooltip-format = "<tt><big>{calendar}</big></tt>";
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#${config.stylix.base16Scheme.base04}'><b>{}</b></span>";
              days = "<span color='#${config.stylix.base16Scheme.base05}'><b>{}</b></span>";
              weeks = "<span color='#${config.stylix.base16Scheme.base04}'><b>W{}</b></span>";
              weekdays = "<span color='#${config.stylix.base16Scheme.base0D}'><b>{}</b></span>";
              today = "<span color='#${config.stylix.base16Scheme.base0A}'><b><u>{}</u></b></span>";
            };
          };
        };

        "hyprland/window" = {
          max-length = 22;
          separate-outputs = false;
          rewrite = {
            "" = "∅";
          };
        };

        "memory" = {
          interval = 5;
          format = "  {}%";
          tooltip = true;
          tooltip-format = "  {used:0.1f}G/{total:0.1f}G";
        };

        "cpu" = {
          interval = 5;
          format = "  {usage:2}%";
          tooltip = true;
        };

        "disk" = {
          format = " {free}";
          tooltip = true;
        };

        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = "  {ipaddr}/{cidr}";
          format-wifi = "  {essid} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = true;
          tooltip-format-ethernet = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "  {essid} ({signalStrength}%)";
          on-click = "sleep 0.1 && nm-applet";
        };

        "tray" = {
          spacing = 12;
        };

        "pulseaudio" = {
          format = "{icon}  {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
        };

        "custom/exit" = {
          tooltip = false;
          format = " ";
          on-click = "sleep 0.1 && wlogout";
        };

        "custom/startmenu" = {
          tooltip = false;
          format = " ";
          on-click = "sleep 0.1 && wofi --dmenu";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = "true";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which mako";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && task-waybar";
          escape = true;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };
      }
    ];
    style = pkgs.lib.concatStrings [
      ''
        * {
          font-family: JetBrainsMono Nerd Font Mono;
          font-size: 16px;
          border-radius: 0px;
          border: none;
          min-height: 0px;
        }
        window#waybar {
          background: rgba(0,0,0,0);
        }
        #workspaces {
          color: #${config.stylix.base16Scheme.base00};
          background: #${config.stylix.base16Scheme.base01};
          margin: 4px 4px;
          padding: 5px 5px;
          border-radius: 16px;
        }
        #workspaces button {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(45deg, #${config.stylix.base16Scheme.base08}, #${config.stylix.base16Scheme.base0D});
          opacity: 0.5;
          transition: ${betterTransition};
        }
        #workspaces button.active {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(45deg, #${config.stylix.base16Scheme.base08}, #${config.stylix.base16Scheme.base0D});
          transition: ${betterTransition};
          opacity: 1.0;
          min-width: 40px;
        }
        #workspaces button:hover {
          font-weight: bold;
          border-radius: 16px;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(45deg, #${config.stylix.base16Scheme.base08}, #${config.stylix.base16Scheme.base0D});
          opacity: 0.8;
          transition: ${betterTransition};
        }
        tooltip {
          background: #${config.stylix.base16Scheme.base00};
          border: 1px solid #${config.stylix.base16Scheme.base08};
          border-radius: 12px;
        }
        tooltip label {
          color: #${config.stylix.base16Scheme.base08};
        }
        #window, #pulseaudio, #network, #cpu, #memory, #disk, #idle_inhibitor {
          font-weight: bold;
          margin: 4px 0px;
          margin-left: 7px;
          padding: 0px 18px;
          background: #${config.stylix.base16Scheme.base04};
          color: #${config.stylix.base16Scheme.base00};
          border-radius: 24px 10px 24px 10px;
        }
        #custom-startmenu {
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(90deg, #${config.stylix.base16Scheme.base0E}, #${config.stylix.base16Scheme.base0C});
          font-size: 28px;
          margin: 0px;
          padding: 0px 30px 0px 15px;
          border-radius: 0px 0px 40px 0px;
        }
        #battery,
        #custom-notification, #tray, #custom-exit {
          font-weight: bold;
          background: #${config.stylix.base16Scheme.base0F};
          color: #${config.stylix.base16Scheme.base00};
          margin: 4px 0px;
          margin-right: 7px;
          margin-left: 7px;
          border-radius: 10px 24px 10px 24px;
          padding: 0px 18px;
        }
        #clock {
          font-weight: bold;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(90deg, #${config.stylix.base16Scheme.base0E}, #${config.stylix.base16Scheme.base0C});
          margin: 0px;
          padding: 0px 15px 0px 30px;
          border-radius: 0px 0px 0px 40px;
        }
      ''
    ];
  };

  xdg.configFile = {
    "hypr" = {
      source = ../dotfiles/hypr;
      recursive = true;
    };
  };
}
