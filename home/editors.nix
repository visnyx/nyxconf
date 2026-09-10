{ pkgs, config, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      ms-vscode.cmake-tools
      ms-vscode.makefile-tools

      ms-python.python
      ms-python.vscode-pylance
      ms-python.debugpy

      rust-lang.rust-analyzer
      tamasfe.even-better-toml

      vscjava.vscode-java-pack
      vscjava.vscode-java-debug
      vscjava.vscode-java-test
      vscjava.vscode-maven
      redhat.java

      jnoortheen.nix-ide

      pkief.material-icon-theme
      eamodio.gitlens
      usernamehw.errorlens
      esbenp.prettier-vscode
      oderwat.indent-rainbow
      aaron-bond.better-comments
    ];
  };

  xdg.configFile."Code/User/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nyxconf/home/vscode-settings.json";
}
