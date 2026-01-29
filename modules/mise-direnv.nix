{
  programs.mise = {
    enable = true;
    globalConfig = {
      tools.go = "1.25";
      tools.node = "22";
    };
  };

  programs.direnv = {
    enable = true;
    config = {
      load_dotenv = true;
      strict_env = true;
      hide_env_diff = true;
    };
    mise.enable = true;
    nix-direnv.enable = true;
  };
}
