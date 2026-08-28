{ pkgs, ... }:

{
  # mesa-git breaks libgbm on optimus offload
  # chaotic.mesa-git.enable = false;

  # GPU driver.
  services.xserver.videoDrivers = [ "nvidia" ];

  # Graphics API support.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      nvidia-vaapi-driver
    ];
  };

  # Switcheroo.
  services.switcherooControl.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;

    # Suspend/resume support.
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Dynamic Boost
    dynamicBoost.enable = true;

    # Offload.
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
