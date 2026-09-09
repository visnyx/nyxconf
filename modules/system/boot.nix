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
  ];
}
