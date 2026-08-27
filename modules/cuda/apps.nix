{ pkgs, inputs, ... }:

let
  cudaPkgs = import inputs.nixpkgs {
    system = pkgs.stdenv.hostPlatform.system;
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
