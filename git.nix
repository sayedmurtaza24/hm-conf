{
  programs.git = {
    enable = true;
    settings = {
      user.name = "sayedmurtaza24";
      user.email = "sayedmurtazamuttahar@gmail.com";
      alias = {
        co = "checkout";
        fp = "push --force-push-with-lease";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    hosts = {
      "github.com" = {
        user = "sayedmurtaza24";
      };
    };
    settings = {
      git_protocol = "https";
      prompt = "enabled";
    };
  };
}
