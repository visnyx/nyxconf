{ config, ... }:

{
  networking.hostName = "nyxstation";

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    settings.connection = {
      "ipv4.ignore-auto-dns" = true;
      "ipv6.ignore-auto-dns" = true;
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "false";
      DNSOverTLS = "opportunistic";
      FallbackDNS = "9.9.9.9#dns.quad9.net 149.112.112.112#dns.quad9.net";
    };
  };

  hardware.bluetooth.enable = true;

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ config.services.tailscale.port ];
    trustedInterfaces = [ "tailscale0" ];
    checkReversePath = "loose";
  };

  services.bpftune.enable = true;
}
