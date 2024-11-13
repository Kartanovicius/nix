{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };

  wlroots_0_19 = inputs.nixpkgs-wayland.packages."${pkgs.system}".wlroots;

  dwl-final = pkgs.unstable.dwl.override {
    configH = builtins.readFile (pkgs.substituteAll { src = ./config.def.h; });
    # withCustomConfigH = "./path/to/your/dwl.c";
  };
in
{
  environment.systemPackages = with pkgs; [ dwl-final ];
}
