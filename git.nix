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
        "git@gitlab.com" = { insteadOf = "https://gitlab.com/"; };
        "git@github.com" = { insteadOf = "https://github.com/"; };
        "git@codeberg.org" = { insteadOf = "https://codeberg.org/"; };
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
