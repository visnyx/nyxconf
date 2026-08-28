{ pkgs, ... }:

{
  # Window manager.
  programs.niri.enable = true;

  # Noctalia shell
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  # Display manager
  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = { };
  };

  # touchpad
  services.libinput.enable = true;

  # XWayland support.
  programs.xwayland.enable = true;

  # Systems packages but for niri
  environment.systemPackages = with pkgs; [
    # idk
    nirimod
    mission-center

    # explorers
    nautilus
    kdePackages.dolphin

    # previews
    ffmpegthumbnailer
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers

    #misc
    xwayland-satellite
    hicolor-icon-theme
    papirus-icon-theme
    shared-mime-info
    adw-gtk3
    gsettings-desktop-schemas
    kdePackages.qt6ct
    bibata-cursors
  ];

  environment.pathsToLink = [ "/share/thumbnailers" ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    fira-sans
    googlesans-code
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [
      "Noto Sans"
      "Fira Sans"
    ];
    monospace = [ "JetBrainsMono Nerd Font" ];
    emoji = [ "Noto Color Emoji" ];
  };

  # Wayland environment variables.
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_SHADER_DISK_CACHE = "1";
    __GL_SHADER_DISK_CACHE_SIZE = "10737418240";
  };

  # Desktop services.
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Secret viewer.
  programs.seahorse.enable = true;

  # Ignore buttons
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
    HandleSuspendKey = "ignore";
  };
}
