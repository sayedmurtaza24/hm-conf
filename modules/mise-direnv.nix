{
  programs.mise = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    mise.enable = true;
    nix-direnv.enable = true;
  };
}
