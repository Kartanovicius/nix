{ default }:
{
  config = {
    mainBar = {
      position = "bottom";
      spacing = 7;
      reload_style_on_change = true;
      modules-left = [
        # "battery"
        # "memory"
        # "cpu"
        # "temperature#cpu"
        # "disk"
        # "temperature#disk"
      ];
      modules-center = [ "river/tags" ];
      modules-right = [
        "network"
        "pulseaudio"
        "battery"
        "clock"
        # "backlight"
        # "bluetooth"
      ];
      clock = {
        format = "{:%H:%M %e/%m}";
        format-alt = "{:%H:%M - %A, %e %B %Y}";
        interval = 10;
        tooltip-format = "{:%e %B %Y}";
      };
      memory = {
        interval = 5;
        format = "{used:0.1f}G/{total:0.1f}G ";
        on-click = "kitty -e 'htop'";
        states = {
          warning = 70;
          critical = 90;
        };
      };
      cpu = {
        interval = 5;
        format = " {usage}%";
        states = {
          warning = 70;
          critical = 90;
        };
        max-length = 10;
        on-click = "kitty --start-as=fullscreen --title btop sh -c 'btop'";
      };
      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = [
          "󰂎"
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
      };
      network = {
        format = "{ifname}";
        format-wifi = "{icon}";
        format-ethernet = "";
        format-disconnected = "睊";
        tooltip-format = "{essid}";
        on-click = "kitty nmtui";
        format-icons = [
          "󰤯"
          "󰤟"
          "󰤢"
          "󰤢"
          "󰤨"
        ];
      };
      "network#vpn" = {
        interface = "tun0";
        format = " ";
        format-disconnected = "⚠  Disconnected";
        tooltip-format = "{ifname}= {ipaddr}/{cidr}";
      };
      pulseaudio = {
        scroll-step = 1;
        format = "{icon} {volume}%";
        format-bluetooth = "{volume}% {icon}  {format_source}";
        format-bluetooth-muted = " {icon}  {format_source}";
        format-muted = "婢";
        format-icons = {
          headphone = "";
          hands-free = "וֹ";
          headset = "  ";
          phone = "";
          portable = "";
          car = " ";
          default = [ "" ];
        };
        on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        on-click-right = "pavucontrol";
        on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +2%";
        on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -2%";
      };
      "pulseaudio#microphone" = {
        format = "{format_source}";
        # format-source = " {volume}%";
        format-source = "";
        format-source-muted = "";
        on-click = "pamixer --default-source -t";
        on-click-right = "pavucontrol";
        on-scroll-up = "pamixer --default-source -i 5";
        on-scroll-down = "pamixer --default-source -d 5";
        scroll-step = 5;
      };
      tray = {
        icon-size = 18;
        spacing = 10;
      };
      "backlight#icon" = {
        format = "{icon} {percent}%  ";
        format-icons = [ "" ];
        on-scroll-down = "brightnessctl -c backlight set 1%-";
        on-scroll-up = "brightnessctl -c backlight set +1%";
      };
      "river/tags" = {
        num-tags = 5;
        tag-labels = [
          "1"
          "2"
          "3"
          "4"
          "5"
        ];
      };
    };
  };
  style = ''
      * {
      font-family: "Fantasque Sans Mono", "JetBrains Mono", "Font Awesome 5 Free";
      font-weight: bold;
      font-size: 15px;
      transition: none;
      margin: 0px;
      border: none;
      border-radius: 0px;
      border-color: ${default.xcolors.grey-300};
      color: ${default.xcolors.text-primary};
    }
    window#waybar {
      border-radius: 0px;
      background: ${default.xcolors.background-primary};
    }
    #waybar {
      margin: 0px;
    }
    #tags {
      margin: 0px;
      margin-top: 0px;
      margin-bottom: 0px;
      margin-left: 5px;
      padding: 0px;
    }
    #tags button {
      box-shadow: none;
      border-bottom: 2px solid ${default.xcolors.background-primary};
      background-color: ${default.xcolors.background-primary};
      color: ${default.xcolors.text-primary};
    }
    #tags button:hover {
      color: ${default.xcolors.text-primary};
      background-color: ${default.xcolors.background-primary};
      border-color: ${default.xcolors.grey-300};
    }
    #tags button.occupied {
      color: ${default.xcolors.text-primary};
      background-color: ${default.xcolors.background-primary};
      border-color: ${default.xcolors.grey-400};
    }
    #tags button.focused {
      color: ${default.xcolors.text-primary};
      background-color: ${default.xcolors.background-primary};
      border-color: ${default.xcolors.grey-500};
    }
    #network {
      padding-right: 14px;
    }
    #network, #pulseaudio, #battery {
      margin-left: 5px;
      margin-right: 5px;
    }
  '';
}
