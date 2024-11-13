{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "spotify" ]; # allow spotify to be installed if you don't have unfree enabled already

  imports = [ inputs.spicetify-nix.homeManagerModules.default ]; # import the flake's module for your system

  programs.spicetify = # configure spicetify :)
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
        adblock
        songStats
      ];
      theme = spicePkgs.themes.text;
    };
}
