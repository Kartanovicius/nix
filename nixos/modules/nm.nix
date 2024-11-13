{
  networking.networkmanager.enable = true;
  networking = {
    extraHosts = ''
      127.0.0.1 host.docker.internal
      127.0.0.1 db
      127.0.0.1 padb
      127.0.0.1 redis
      127.0.0.1 yugabyte
    '';
    firewall = {
      enable = true;
      allowedTCPPorts = [
        # 80
        # 443
        # 3000
      ];
      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };
}
