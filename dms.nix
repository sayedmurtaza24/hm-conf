{
  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableBrightnessControl = false;
    enableNightMode = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$menu" = "dms ipc call spotlight toggle";
  };
}
