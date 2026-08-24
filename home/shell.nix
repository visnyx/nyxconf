{ ... }:

{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "";
    };

    history = {
      size = 50000;
      save = 50000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
      extended = true;
    };

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -l --icons --group-directories-first --git";
      la = "eza -la --icons --group-directories-first --git";
      lt = "eza --tree --icons --level=2";
      cat = "bat --style=auto";
      grep = "rg";
      find = "fd";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";

      rebuild = "nh os switch";
      update = "nh os switch --update";
      garbage = "nh clean all";
      flakeup = "nix flake update --flake /home/nyxee/my-nixosconfig";

      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline -20";
      gd = "git diff";

      cls = "clear";
      ports = "ss -tulnp";
      myip = "curl -s ifconfig.me";
      df = "df -h";
      mkdir = "mkdir -pv";
    };

    initContent = ''
      # Automated system update.
      sysup() {
        # Navigate to configuration.
        cd /home/nyxee/my-nixosconfig || return 1
        git add -A

        # Prompt for commit.
        echo -n "Commit message: "
        read -r msg

        if [[ -z "$msg" ]]; then
          echo "Aborted: Commit message cannot be empty."
          return 1
        fi

        git commit -m "$msg"
        git push
        nh os switch

        # Return.
        cd - > /dev/null
      }

      # Completion settings.
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

      # Menu selection.
      zstyle ':completion:*' menu select

      # Completion colors.
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

      # Group completions.
      zstyle ':completion:*' group-name '''
      zstyle ':completion:*:descriptions' format '%F{cyan}── %d ──%f'
      zstyle ':completion:*:warnings' format '%F{red}no matches%f'

      # Completion cache.
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "$HinputsOME/.cache/zsh/compcache"

      # Kill menu.
      zstyle ':completion:*:*:kill:*' menu yes select
      zstyle ':completion:*:kill:*' force-list always

      # Keybindings.
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
      bindkey '^A'   beginning-of-line
      bindkey '^E'   end-of-line
      bindkey '^W'   backward-kill-word
      bindkey '^[[3~' delete-char
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word

      # Autosuggest shortcut.
      bindkey '^ ' autosuggest-accept
    '';
  };

  # Prompt configuration.
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "1_shell";
  };
}
