{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr ];
    wlr = {
      enable = true;
    };
    config.common.default = "wlr";
  };
}
