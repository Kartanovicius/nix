{
  wayland.windowManager.river = {
    enable = true;
    settings = {
      spawn = [
        "mako"
        "kanshi"
        "waybar"
        "gammastep"
        "lxsession"
        "swaybg -m fill -i \"/home/donatask/Pictures/wallpaper/w6.png\""
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river"
      ];
    };
  };
}
