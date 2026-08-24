{ pkgs, ... }:

{
  # Plasma DE
  services.desktopManager.plasma6.enable = true;

  # Plasma display manager.
  services.displayManager.plasma-login-manager.enable = true;

  # GTK.
  environment.systemPackages = with pkgs; [
    adw-gtk3
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    fira-sans
    googlesans-code
  ];

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
}
