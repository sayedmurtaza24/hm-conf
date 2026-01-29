{ pkgs, pkgsStable, inputs, config, ... }:
let
  iconTheme = {
    name = "Reversal-black-dark";
    pkg = pkgsStable.reversal-icon-theme.override {
      colorVariants = [ "-black" ];
    };
  };
in
{
  home.username = "murtaza";
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/murtaza";

  imports = [
    ./common.nix

    ./modules/rofi-pass.nix
    ./modules/hyprland.nix
    ./modules/desktop.nix
    ./modules/flatpak.nix

    # Desktop shell
    ./modules/noctalia.nix
    # ./modules/dms.nix

    # ./caelestia.nix
  ];

  systemd.user.sessionVariables = {
    PATH = "${config.home.profileDirectory}/bin:/run/current-system/sw/bin";
    QT_STYLE_OVERRIDE = "Adwaita-dark";
    QS_ICON_THEME=iconTheme.name;
  };

  home.pointerCursor = {
    gtk.enable = true;
    hyprcursor.enable = true;

    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

  home.packages = with pkgs; [
    iconTheme.pkg

    # command line tools
    nvtopPackages.amd
    wl-clipboard
    swaybg
    file
    bitwarden-cli
    bluetui
    impala
    libnotify
    proton-vpn-cli

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
    digikam
    telegram-desktop

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
      name = iconTheme.name;
      package = iconTheme.pkg;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  services.cliphist.enable = true;

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
