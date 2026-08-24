{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    easyeffects
    lorien
    mpv
    ffmpeg
    losslesscut
  ];
}
