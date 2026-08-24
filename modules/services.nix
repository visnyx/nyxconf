{ pkgs, ... }:

{
  # Flatpak.
  services.flatpak.enable = true;

  # Partition manager.
  programs.partition-manager.enable = true;

  # KDE Connect.
  programs.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };

  # OpenRGB hardware control.
  services.hardware.openrgb.enable = true;

  # Schedx
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = [ "--autopilot" ];
  };

  # Tailscale
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
