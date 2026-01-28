{
  programs.mise = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    config = {
      load_dotenv = true;
      strict_env = true;
    };
    mise.enable = true;
    nix-direnv.enable = true;
  };
}
