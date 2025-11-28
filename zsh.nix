{
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
        enable = true;
	# highlight = true;
	strategy = [ "history" "completion" ];
    };
    defaultKeymap = "viins";
    history = {
	findNoDups = true;
	ignoreAllDups = true;
        ignoreSpace = true;
        size = 50000;
    };
    historySubstringSearch = {
    	enable = true;
    };
    initContent = ''
      export LESS='-R'
      export GROFF_NO_SGR=1

      man() {
          env \
          LESS_TERMCAP_mb=$(printf "\e[1;31m") \
          LESS_TERMCAP_md=$(printf "\e[1;36m") \
          LESS_TERMCAP_me=$(printf "\e[0m") \
          LESS_TERMCAP_se=$(printf "\e[0m") \
          LESS_TERMCAP_so=$(printf "\e[1;44;37m") \
          LESS_TERMCAP_ue=$(printf "\e[0m") \
          LESS_TERMCAP_us=$(printf "\e[1;32m") \
          man "$@"
      }

      # Enable vim mode
      set -o vi

      alias conf="sudo -E nvim -c 'cd /etc/nixos/' -c ':lua Snacks.picker.smart()'";
      alias lgit="lazygit";
      alias nrs="sudo nixos-rebuild switch";
      alias hms="home-manager switch";
      alias hc="cd ~/.config/home-manager && nvim";
      alias cd="z";
    '';
  };

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };
}
