{ pkgs, ... }:

{
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      hyprlock
      rofi
      gammastep
      waybar
    ];
  };
}
