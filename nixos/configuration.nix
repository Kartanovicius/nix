{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./packages.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.

  time.timeZone = "Europe/Prague"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # Enabling flakes

  services = {
    xserver.displayManager.lightdm.enable = false;
    libinput.enable = true;
    dbus.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    gnome = {
      sushi.enable = true;
      gnome-keyring.enable = true;
    };
    upower.enable = true;
  };
  programs.dconf.enable = true;

  security.pam.services.gdm.enableGnomeKeyring = true;

  services.printing.enable = true; # Enable CUPS to print documents.

  security.pam.services.hyprlock = { };

  # systemd.user.sessionVariables.SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  programs.ssh.startAgent = true;

  security.polkit.enable = true;

  nixpkgs.config.allowUnfree = true; # Allow unfree packages

  system.stateVersion = "23.11"; # Did you read the comment?
}
