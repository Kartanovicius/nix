{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      "insecure-registries" = [ "cregistry.pricefx.eu" ];
      experimental = true;
    };
  };
  virtualisation.oci-containers.backend = "docker";
}
