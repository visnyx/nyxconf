{ pkgs, ... }:

{
  # User definition.
  programs.zsh.enable = true;

  users.users."nyxee" = {
    isNormalUser = true;
    description = "nyx";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;

    packages = with pkgs; [
      # larp
      cava
    ];
  };
}
