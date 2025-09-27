{
  pkgs,
  inputs,
  ...
}:

{
  # services.noctalia-shell.enable = true;

  programs.noctalia-shell = {
    enable = true;
  };

  home.packages = [
    inputs.noctalia-shell.packages.${pkgs.system}.default
  ];

  systemd.user.services.noctalia-shell = {
    Unit = {
      Description = "Noctalia Shell";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${inputs.noctalia-shell.packages.${pkgs.system}.default}/bin/noctalia-shell";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    "$menu" = "noctalia-shell ipc call launcher toggle";
  };
}
