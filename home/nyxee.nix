{ ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./editors.nix
    ./cli-tools.nix
  ];

  home.username = "nyxee";
  home.homeDirectory = "/home/nyxee";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
