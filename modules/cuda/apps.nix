{ pkgs, inputs, ... }:

let
  cudaPkgs = import inputs.nixpkgs {
    inherit (pkgs) system;
    config = {
      allowUnfree = true;
      cudaSupport = true;
    };
  };
in

{
  environment.systemPackages = [
    cudaPkgs.blender
    cudaPkgs.obs-studio
    cudaPkgs.upscayl
  ];
}
