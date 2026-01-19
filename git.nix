{
  programs.git = {
    enable = true;
    settings = {
      user.name = "murtaza";
      user.email = "sayedmurtazamuttahary@gmail.com";
      alias = {
        co = "checkout";
        fp = "push --force-with-lease";
      };
      url = {
        # "git@gitlab.com" = { insteadOf = "https://gitlab.com/"; };
        "git@github.com" = { insteadOf = "https://github.com/"; };
        "git@codeberg.org" = { insteadOf = "https://codeberg.org/"; };
      };
      push.autoSetupRemote = true;
      rebase.autosquash = true;
      rerere.enabled = true;
    };
  };

  programs.zsh.shellAliases = {
    rebase = "git fetch && git rebase origin/main";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      syntax-theme = "Dracula";
      navigate = true;
      light = false;
      side-by-side = true;
      tabs = 3;
      file-style = "#ff9b00 ul bold";
      file-decoration-style = "ul";
      line-numbers = true;
      line-numbers-left-format = "{nm:>1}|";
      line-numbers-minus-style = "#ff0051 bold";
      line-numbers-plus-style = "#1ac71e bold";
      line-numbers-right-format = "{np:>1}|";
      line-numbers-zero-style = "#aaaaaa italic";
    };
  };
}
