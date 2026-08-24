{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    python3
    gcc
    glib
  ];
}
