{
  config,
  ...
}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.timeout = 0;
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
    "rcutree.enable_rcu_lazy=1"
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];

  # Plymouth
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.plymouth = {
    enable = true;
  };
}
