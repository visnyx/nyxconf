{ pkgs, ... }:
{
  # Fuzzy finder.
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height=40%"
      "--layout=reverse"
      "--border=rounded"
    ];
  };

  # Smart directory navigation.
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Syntax highlighted cat.
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin Mocha";
      style = "numbers,changes,header";
    };
    themes = {
      "Catppuccin Mocha" = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
          hash = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  };

  # Modern ls replacement.
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
  };

  # Environment variable manager.
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case"
      "--hidden"
      "--glob=!.git"
    ];
  };

  # Additional CLI tools.
  home.packages = with pkgs; [
    nixd
    nixfmt
    fd
    tldr
    procs
    dust
  ];
}
