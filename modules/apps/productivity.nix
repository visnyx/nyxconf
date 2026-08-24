{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    obsidian
    meld
  ];
}
