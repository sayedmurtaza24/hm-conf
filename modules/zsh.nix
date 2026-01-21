{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = "${config.xdg.configHome}/zsh";
    history.ignoreDups = false;
    history.ignoreSpace = false;
    history.share = false;

    shellAliases = {
       conf = "sudo -E nvim -c 'cd /etc/nixos/' -c ':lua Snacks.picker.smart()'";
       nrs  = "sudo nixos-rebuild switch";
       drs  = "sudo darwin-rebuild switch";
       hms  = "home-manager switch";
       hc   = "cd ~/.config/home-manager && nvim";
       cd   = "z";
    };

    initContent = let
    	earlyInit = lib.mkOrder 500 ''
          unset _comps
          ZSH_AUTOSUGGEST_MANUAL_REBIND=1
          ZIM_HOME=${config.xdg.configHome}/zim/
          ZIM_CONFIG_FILE=${config.xdg.configHome}/zim/.zimrc
          if [[ ! -e ''${ZIM_HOME}/zimfw.zsh ]]; then
            curl -fsSL --create-dirs -o ''${ZIM_HOME}/zimfw.zsh \
              https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
          fi
          if [[ ! ''${ZIM_HOME}/init.zsh -nt ''${ZIM_CONFIG_FILE} ]]; then
            source ''${ZIM_HOME}/zimfw.zsh init
          fi
          source ''${ZIM_HOME}/init.zsh
      '';

      normalConfig = lib.mkOrder 1000 ''
        export LESS='-R' export GROFF_NO_SGR=1

        man() {
            env \
            MANPAGER=less \
            LESS_TERMCAP_mb=$(printf "\e[1;31m") \
            LESS_TERMCAP_md=$(printf "\e[1;36m") \
            LESS_TERMCAP_me=$(printf "\e[0m") \
            LESS_TERMCAP_se=$(printf "\e[0m") \
            LESS_TERMCAP_so=$(printf "\e[1;44;37m") \
            LESS_TERMCAP_ue=$(printf "\e[0m") \
            LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
        }

        [[ -f "${config.home.homeDirectory}/.env" ]] && source "${config.home.homeDirectory}/.env"
      '';

      in lib.mkMerge [ earlyInit normalConfig ];
  };

  home.file."${config.xdg.configHome}/zim/.zimrc" = {
    enable = true;
    text = ''
      # Sets sane Zsh built-in environment options.
      zmodule environment
      # Provides handy git aliases and functions.
      zmodule git
      # Applies correct bindkeys for input events.
      zmodule input
      # Sets a custom terminal title.
      zmodule termtitle
      # Utility aliases and functions. Adds colour to ls, grep and less.
      zmodule utility

      # Prompt
      # Exposes how long the last command took to run to prompts.
      zmodule duration-info
      # Exposes git repository status information to prompts.
      zmodule git-info
      zmodule prompt-pwd
      # A heavily reduced, ASCII-only version of the Spaceship and Starship prompts.
      zmodule eriner

      # Completion
      # Additional completion definitions for Zsh.
      zmodule zsh-users/zsh-completions --fpath src
      # Enables and configures smart and extensive tab completion, must be sourced
      # after all modules that add completion definitions.
      zmodule completion

      # Modules that must be initialized last
      # Fish-like syntax highlighting for Zsh, must be sourced after completion.
      zmodule zsh-users/zsh-syntax-highlighting
      # Fish-like history search for Zsh, must be sourced after
      # zsh-users/zsh-syntax-highlighting.
      zmodule zsh-users/zsh-history-substring-search
      # Fish-like autosuggestions for Zsh. Add the following to your ~/.zshrc to boost
      # performance: ZSH_AUTOSUGGEST_MANUAL_REBIND=1
      zmodule zsh-users/zsh-autosuggestions
    '';
  };

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };
}
