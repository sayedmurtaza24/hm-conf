{
  programs.dankMaterialShell = {
    enable = true;
    systemd = {
      enable = true;
    };
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableBrightnessControl = false;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$menu" = "dms ipc call spotlight toggle";
  };
}
