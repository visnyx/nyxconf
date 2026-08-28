{ pkgs, ... }:
{
  # VS Code editor.
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      # C/C++ extensions.
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      ms-vscode.cmake-tools
      ms-vscode.makefile-tools

      # Python extensions.
      ms-python.python
      ms-python.vscode-pylance
      ms-python.debugpy

      # Rust extensions.
      rust-lang.rust-analyzer
      tamasfe.even-better-toml

      # Java extensions.
      vscjava.vscode-java-pack
      vscjava.vscode-java-debug
      vscjava.vscode-java-test
      vscjava.vscode-maven
      redhat.java

      # Nix extensions.
      jnoortheen.nix-ide

      # Quality of life extensions.
      pkief.material-icon-theme
      eamodio.gitlens
      usernamehw.errorlens
      esbenp.prettier-vscode
      oderwat.indent-rainbow
      aaron-bond.better-comments
      catppuccin.catppuccin-vsc
    ];

    profiles.default.userSettings = {
      # Aesthetic settings.
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.startupEditor" = "none";
      "workbench.tree.indent" = 14;
      "workbench.tree.renderIndentGuides" = "always";
      "window.dialogStyle" = "custom";
      "window.menuBarVisibility" = "compact";
      "window.titleBarStyle" = "custom";

      # Editor visuals.
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'Fira Sans', monospace";
      "editor.fontSize" = 13;
      "editor.lineHeight" = 22;
      "editor.fontLigatures" = true;
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.cursorStyle" = "line";
      "editor.smoothScrolling" = true;
      "workbench.list.smoothScrolling" = true;
      "editor.padding.top" = 8;
      "editor.padding.bottom" = 8;
      "editor.renderLineHighlight" = "all";
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = true;
      "editor.guides.indentation" = true;
      "editor.minimap.enabled" = false;

      # Productivity settings.
      "editor.formatOnSave" = true;
      "editor.linkedEditing" = true;
      "editor.suggestSelection" = "recentlyUsed";
      "editor.tabSize" = 2;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;

      # Inline errors.
      "errorLens.fontStyleItalic" = true;
      "errorLens.gutterIconsEnabled" = true;

      # Language formatting.
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.formatterPath" = "nixfmt";
      "nix.serverSettings" = {
        "nixd" = {
          "nixpkgs" = {
            "expr" = "import <nixpkgs> {};";
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"/home/nyxee/nyxconf\").nixosConfigurations.nyxstation.options";
            };
          };
        };
      };

      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[jsonc]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
  };
}
