{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    upscayl
    blender
  ];
}
