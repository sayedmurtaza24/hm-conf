{ config, lib, ... }:
{
  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  gtk.gtk3.extraCss = ''
    @import url("${config.xdg.configHome}/gtk-4.0/dank-colors.css");
  '';

  gtk.gtk4.extraCss = ''
    @import url("${config.xdg.configHome}/gtk-4.0/dank-colors.css");
  '';

  home.file."${config.xdg.configHome}/gtk-4.0/settings.ini".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-3.0/settings.ini".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-4.0/gtk.css".force = lib.mkForce true;
  home.file."${config.xdg.configHome}/gtk-3.0/gtk.css".force = lib.mkForce true;

  wayland.windowManager.hyprland.settings = {
    "$menu" = "dms ipc call spotlight toggle";
  };
}
