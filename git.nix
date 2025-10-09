{
  programs.git = {
    enable = true;
    userName = "sayedmurtaza24";
    userEmail = "sayedmurtazamuttahar@gmail.com";
      aliases = {
        co = "checkout";
        fp = "push --force-push-with-lease";
      };
    delta = {
      enable = true;
    };
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
