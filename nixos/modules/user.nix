{ pkgs, ... }:
{
  programs.zsh.enable = true;

  # Enable automatic login for the user.
  services.getty.autologinUser = "donatask";
  users = {
    defaultUserShell = pkgs.zsh;

    users.donatask = {
      isNormalUser = true;
      description = "Donatas Kartanovicius";
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
        "docker"
        "libvirtd"
        "input"
      ];
      packages = with pkgs; [ ];
    };
  };
}
