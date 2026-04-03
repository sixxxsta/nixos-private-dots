{ pkgs, config, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "niri/window" ];
        modules-right = [
          "niri/language"
          "backlight"
          "pulseaudio"
          "network"
          "battery"
          "clock"
          "tray"
        ];

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "•";
            active = "●";
            focused = "●";
            urgent = "!";
          };
        };

        "niri/window" = {
          format = "{title}";
        };

        "niri/language" = {
          format = "⌨ {}";
        };

        backlight = {
          format = "☀ {percent}%";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-icons = {
            default = [ "" "" ];
            car = "";
            handsfree = "";
            headphones = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = "";
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "  {ipaddr}";
          format-disconnected = "󰖪 offline";
          tooltip-format = "{ifname} via {gwaddr}";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-alt = "{time} {icon}";
          format-charging = " {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          states = {
            critical = 1;
            warning = 30;
          };
        };

        clock = {
          format = "{:%d.%m.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
        };

        tray = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0px;
        font-family: "JetBrains Mono";
        font-weight: bold;
        font-size: 16px;
        min-height: 0;
        color: #ebdbb2;
        margin: 0;
        padding: 0;
      }

      window#waybar {
        background: #1d2021;
      }

      #workspaces button label {
        padding: 0 20px;
      }

      #workspaces button.active label {
        color: #1d2021;
      }

      #workspaces button:hover {
        background: #3c3836;
      }

      #workspaces button.active {
        background: #d65d0e;
      }

      #clock,
      #battery,
      #pulseaudio,
      #backlight,
      #network,
      #tray,
      #language {
        padding: 0 10px;
      }

      #language {
        color: #d79921;
        border-bottom: 5px solid #d79921;
      }

      #backlight {
        color: #fe8019;
        border-bottom: 5px solid #fe8019;
      }

      #pulseaudio {
        color: #689d6a;
        border-bottom: 5px solid #689d6a;
      }

      #network {
        color: #83a598;
        border-bottom: 5px solid #83a598;
      }

      #pulseaudio.muted {
        padding: 0 20px;
        color: #cc241d;
        border-bottom: 5px solid #cc241d;
      }

      #battery {
        color: #458588;
        border-bottom: 5px solid #458588;
      }

      #clock {
        color: #b16286;
        border-bottom: 5px solid #b16286;
      }

      #tray {
        color: #d65d0e;
        border-bottom: 5px solid #d65d0e;
      }
    '';
  };

  home.packages = with pkgs; [
    waybar
  ];
}
