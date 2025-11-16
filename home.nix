{
  config,
  lib,
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
    ./desktop.nix
  ];

  systemd.user.sessionVariables = {
    PATH = "${config.home.profileDirectory}/bin:/run/current-system/sw/bin";
    EDITOR = "${pkgs.neovim}";
    QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
    QT_STYLE_OVERRIDE = "Adwaita-Dark";
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
    btop

    # desktop apps
    bitwarden-desktop
    nautilus
    qimgv
    gnome-tweaks
    rofi
    nwg-look
    grim
    rawtherapee
    showtime
    totem

    # extra
    gnome-themes-extra
    playerctl
    sassc
    gtk-engine-murrine
    xorg.xrdb
    kdePackages.qt6ct
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "Adwaita-Dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.file."${config.xdg.configHome}/gtk-4.0/settings.ini".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-3.0/settings.ini".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-4.0/gtk.css".force = lib.mkForce true;

  services.flatpak.enable = true;
  services.flatpak.packages = [
    { appId = "com.brave.Browser"; origin = "flathub";  }
    { appId = "com.github.tchx84.Flatseal"; origin = "flathub";  }
    { appId = "app.zen_browser.zen"; origin = "flathub";  }
    { appId = "net.nokyan.Resources"; origin = "flathub"; }
  ];

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  # services.vicinae = {
  #     enable = true;
  #     autoStart = true;
  # };
  #
  services.dunst.enable = true;
  services.cliphist.enable = true;
  services.ollama.enable = true;
}
