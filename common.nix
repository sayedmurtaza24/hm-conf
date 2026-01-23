{ pkgs, config, ... }:
{
  nix.gc = {
    automatic = true;
  };

  home.preferXdgDirectories = true;

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  imports = [
    ./modules/ghostty.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/lazygit.nix
  ];

  home.packages = with pkgs; [
    # language servers
    vtsls
    nixd
    eslint
    lua-language-server
    gopls
    protols
    zls
    vscode-json-languageserver
    prettier

    # programming languages
    zig
    go

    # command line tools
    curl
    fd
    ripgrep
    btop

    # desktop apps
    bitwarden-desktop
  ];

  programs.zoxide.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.activation.nvimSymlink = config.lib.dag.entryAfter ["writeBoundary"] ''
    rm -rf ${config.home.homeDirectory}/.config/nvim
    ln -sf ${config.home.homeDirectory}/.config/home-manager/nvim ${config.home.homeDirectory}/.config/nvim
  '';

  # services.podman.enable = true;
  # services.ollama.enable = true;
}
