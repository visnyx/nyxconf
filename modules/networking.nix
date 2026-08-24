{ config, ... }:

{
  networking.hostName = "nyxstation";
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    # Ignore DHCP-provided DNS
    settings.connection = {
      "ipv4.ignore-auto-dns" = true;
      "ipv6.ignore-auto-dns" = true;
    };
  };

  networking.nameservers = [ "127.0.0.1" ];

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "false";
      Domains = "~.";
      # fallback dns
      FallbackDNS = "9.9.9.9 149.112.112.112";
    };
  };

  # Blocky DoH.
  services.blocky = {
    enable = true;
    settings = {
      ports = {
        dns = "127.0.0.1:53";
        http = "127.0.0.1:4000";
      };

      upstreams.groups.default = [
        "https://dns.quad9.net/dns-query"
      ];

      bootstrapDns = [
        "9.9.9.9"
        "149.112.112.112"
      ];

      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };

      queryLog.type = "none";
    };
  };

  # Bluetooth.
  hardware.bluetooth = {
    enable = true;
  };

  # Firewall.
  networking.firewall = {
    enable = true;
    # Allow Tailscale wireguard
    allowedUDPPorts = [ config.services.tailscale.port ];
    # Trust tailscale0 so the protonvpn kill switch wont vaporize tailscale
    trustedInterfaces = [ "tailscale0" ];
    checkReversePath = "loose";
  };

  # bpftune.
  services.bpftune.enable = true;
}
