{
  programs.git = {
    enable = true;
    settings = {
      user.name = "murtaza";
      user.email = "sayedmurtazamuttahary@gmail.com";
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
}
