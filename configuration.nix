{
  inputs,
  ...
}:

{
  imports = [
    # hw stuff
    ./hardware/hardware-configuration.nix
    ./hardware/nvidia.nix

    # De or Wms
    # ./modules/dewm/desktopplasma.nix
    ./modules/dewm/desktopniri.nix

    # Modules

    ./modules/networking.nix
    ./modules/audio.nix
    ./modules/performance.nix
    ./modules/users.nix
    ./modules/gaming.nix
    ./modules/services.nix

    # Just apps
    ./modules/apps/cli.nix
    ./modules/apps/media.nix
    ./modules/apps/web.nix
    ./modules/apps/social.nix
    ./modules/apps/design.nix
    ./modules/apps/productivity.nix
    ./modules/apps/development.nix
    ./modules/apps/utilities.nix
    ./modules/apps/system.nix

    # Cuda
    ./modules/cuda/apps.nix
    ./modules/cuda/services.nix

    # System
    ./modules/system/boot.nix

    # kernels
    ./modules/system/cachy.nix
    #./modules/system/zen.nix
  ];

  # Pin nixpkgs for imperative commands.
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Flakes and new nix CLI.
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    trusted-users = [ "root" ];

    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos-cuda.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
  };

  # Unfree + CUDA
  nixpkgs.config.allowUnfree = true;

  # Nix helper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/home/nyxee/nyxconf";
  };

  # Run unpatched binaries.
  programs.nix-ld.enable = true;

  # Home Manager.
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users."nyxee" = import ./home/nyxee.nix;
  };

  # Locale.
  i18n.defaultLocale = "en_US.UTF-8";

  # Timezone.
  time.timeZone = "America/Caracas"; # <- peak

  # Btrfs mount options.
  fileSystems."/".options = [
    "compress=zstd"
    "noatime"
  ];
  fileSystems."/home".options = [
    "subvol=home"
    "compress=zstd"
    "noatime"
  ];
  fileSystems."/nix".options = [
    "subvol=nix"
    "compress=zstd"
    "noatime"
  ];

  system.stateVersion = "26.05";
  # nuke ^
}
