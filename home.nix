{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak

    ./ghostty.nix
    ./rofi-pass.nix
    ./hyprland.nix
    ./bash.nix
    # ./remotegamepad.nix
    # ./caelestia.nix
    # ./noctalia.nix
    ./dms.nix
    ./git.nix
  ];

  systemd.user.sessionVariables = {
    PATH = "${config.home.profileDirectory}/bin:/run/current-system/sw/bin";
    EDITOR = "${pkgs.neovim}";
  };

  programs.home-manager.enable = true;

  home.username = "murtaza";
  home.homeDirectory = "/home/murtaza";
  home.stateVersion = "25.05"; # Use your NixOS version

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    hyprcursor.enable = true;

    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

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
    lazygit
    curl
    fd
    ripgrep
    nvtopPackages.amd
    wl-clipboard
    swaybg
    file
    bitwarden-cli
    bluetui
    impala

    # desktop apps
    bitwarden-desktop
    # brave
    nautilus
    qimgv
    gnome-tweaks
    rofi
    nwg-look
    webcord
    gfn-electron
    grim
    rawtherapee
    showtime
    totem

    # extra
    gnome-themes-extra
    playerctl
    sassc
    gtk-engine-murrine
  ];

  programs.zoxide.enable = true;
  programs.zoxide.enableBashIntegration = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lutris = {
    enable = true;
    extraPackages = with pkgs; [mangohud winetricks gamemode umu-launcher];
  };

  services.flatpak.packages = [
    { appId = "com.brave.Browser"; origin = "flathub";  }
  ];

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  services.dunst.enable = true;
  services.cliphist.enable = true;
  services.ollama.enable = true;
}
