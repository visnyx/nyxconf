{ pkgs, ... }:

{
  # Kernel sysctl.
  boot.kernel.sysctl = {
    "vm.max_map_count" = 1048576;

    # ZRAM swap.
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;

    # Disk writes.
    "vm.dirty_ratio" = 10;
    "vm.dirty_background_ratio" = 5;

    # Bufferbloat control.
    "net.core.default_qdisc" = "cake";

    # TCP congestion.
    "net.ipv4.tcp_congestion_control" = "bbr";

    # SYN flood protection.
    "net.ipv4.tcp_syncookies" = 1;
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  # Periodic SSD TRIM.
  services.fstrim.enable = true;

  # Btrfs maintenance.
  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.interval = "monthly";

  # Power management.
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Thermal daemon.
  services.thermald.enable = true;

  # Disable hibernation.
  # cuz no sdd swap just zram.
  systemd.sleep.settings.Sleep = {
    AllowHibernation = "no";
    AllowHybridSleep = "no";
    AllowSuspendThenHibernate = "no";
  };

  # Ananicy cpp
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos_git;
  };
}
