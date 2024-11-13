{
  default,
  pkgs,
  lib,
  ...
}:

with lib;
let
  waybar_theme = import ./themes/round.nix { inherit default; };
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = waybar_theme.style;
    settings = waybar_theme.config;
  };
}
