{
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    inputs.omniflake.flakes."brave-origin-flake".packages.${pkgs.system}.default
  ];
}
