{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # moved to modules/cuda/apps.nix
  ];
}
