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
       lgit = "lazygit";
       nrs  = "sudo nixos-rebuild switch";
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
      ''; in lib.mkMerge [ earlyInit normalConfig ];
  };

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };
}
