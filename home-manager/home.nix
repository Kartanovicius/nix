{ lib, pkgs, ... }:

{
  imports = [
    ./modules
    ../lib
  ];

  home = {
    username = "donatask";
    homeDirectory = "/home/donatask";
    stateVersion = "24.05";
  };
}
