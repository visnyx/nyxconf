{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = { };
  };

  services.libinput.enable = true;

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    nwg-displays
    wdisplays
    mission-center
    nautilus
    kdePackages.dolphin
    ffmpegthumbnailer
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    xwayland-satellite
    hicolor-icon-theme
    papirus-icon-theme
    shared-mime-info
    adw-gtk3
    gsettings-desktop-schemas
    kdePackages.qt6ct
    bibata-cursors
    kdePackages.gwenview
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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    __GL_SHADER_DISK_CACHE = "1";
    __GL_SHADER_DISK_CACHE_SIZE = "10737418240";
  };

  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  programs.seahorse.enable = true;

  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
    HandleSuspendKey = "ignore";
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
  };
}
