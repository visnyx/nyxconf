{ pkgs, ... }:

{
  # Steam.
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Gamemode.
  # programs.gamemode.enable = true;
  # disabled because ananicy cpp xd

  # Gamescope.
  programs.gamescope.enable = true;

  # Gaming utilities.
  environment.systemPackages = with pkgs; [
    mangohud
    vulkan-tools
    heroic
    goverlay
  ];
}
