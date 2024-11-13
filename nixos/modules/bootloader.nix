{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-52917a5b-8398-43d6-a22f-4df5068a245b".device = "/dev/disk/by-uuid/52917a5b-8398-43d6-a22f-4df5068a245b";
}
