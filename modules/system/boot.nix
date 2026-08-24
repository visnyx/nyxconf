{
  config,
  ...
}:

{
  # Bootloader
  boot.loader.limine = {
    enable = true;
    maxGenerations = 10;
    efiSupport = true;

    style = {
      wallpapers = [ ../wallpapers/y2kblurred.png ];
      wallpaperStyle = "stretched";

      interface.branding = "";

      graphicalTerminal = {
        background = "FF000000";
        brightBackground = "FF000000";
      };
    };
  };

  boot.loader.efi.canTouchEfiVariables = true;

  # MSI modules
  boot.extraModulePackages = [ config.boot.kernelPackages.msi-ec ];
  boot.kernelModules = [
    "kvm-intel"
    "msi-ec"
    "ec_sys"
  ];

  # msi ec fix
  boot.extraModprobeConfig = ''
    options ec_sys write_support=1
  '';

  # ram errors on wake r annoying
  boot.kernelParams = [
    "module_blacklist=spd5118"
  ];
}
