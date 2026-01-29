{
  programs.mise = {
    enable = true;
    globalConfig = {
      tools.go = "1.25";
      tools.node = "22";
      tools.superhtml = "0.6";
    };
  };

  programs.direnv = {
    enable = true;
    config = {
      strict_env = true;
      hide_env_diff = true;
    };
    mise.enable = true;
    nix-direnv.enable = true;
  };
}
