{ pkgs, inputs, config, lib, ... }:
let
  reversal-black = pkgs.reversal-icon-theme.override {
    colorVariants = [ "-black" ];
  };
in
{
  home.username = "murtaza";
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/murtaza";

  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak

    ./common.nix

    ./modules/rofi-pass.nix
    ./modules/hyprland.nix
    ./modules/desktop.nix
    ./modules/noctalia.nix

    # ./caelestia.nix
    # ./dms.nix
  ];

  systemd.user.sessionVariables = {
    PATH = "${config.home.profileDirectory}/bin:/run/current-system/sw/bin";
    QT_STYLE_OVERRIDE = "Adwaita-dark";
    QS_ICON_THEME="Reversal-black";
  };

  home.pointerCursor = {
    gtk.enable = true;
    hyprcursor.enable = true;

    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

  home.packages = with pkgs; [
    reversal-black

    # command line tools
    nvtopPackages.amd
    wl-clipboard
    swaybg
    file
    bitwarden-cli
    bluetui
    impala
    libnotify

    # desktop apps
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
    gtk-engine-murrine
    xorg.xrdb
    kdePackages.qt6ct

    # needed for theming
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

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
    iconTheme = {
      name = "Reversal-black";
      package = reversal-black;
    };
    gtk3.extraCss = ''
      @import url("${config.xdg.configHome}/gtk-4.0/dank-colors.css");
    '';
    gtk4.extraCss = ''
      @import url("${config.xdg.configHome}/gtk-4.0/dank-colors.css");
    '';
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.file."${config.xdg.configHome}/gtk-4.0/settings.ini".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-3.0/settings.ini".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-4.0/gtk.css".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-3.0/gtk.css".force = lib.mkForce true;

  services.cliphist.enable = true;
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
}
