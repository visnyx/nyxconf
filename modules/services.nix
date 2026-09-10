{ pkgs, ... }:

{
  # Flatpak.
  services.flatpak.enable = true;

  # Partition manager.
  programs.partition-manager.enable = true;

  # KDE Connect.
  programs.kdeconnect = {
    enable = true;
  };

  # OpenRGB hardware control.
  services.hardware.openrgb.enable = true;

  # Tailscale
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  # Virtualization & containers + nvidia
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  hardware.nvidia-container-toolkit.enable = true;
}
