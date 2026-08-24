{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mcontrolcenter
    nwg-look
    darkly
  ];
}
