{ ... }:

{
  # Git configuration.
  programs.git = {
    enable = true;
    settings = {
      user.name = "Nyxee";
      user.email = "visiblename@proton.me";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };

  # Delta pager.
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
      syntax-theme = "Catppuccin Mocha";
    };
  };
}
