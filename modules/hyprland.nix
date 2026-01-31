{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor configuration
      monitor = [
        "DP-3,highrr,auto,auto,vrr,1"
      ];

      # Program variables
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$mainMod" = "SUPER";
      "$windowManageMod" = "ALT";
      "$blur_layer" = "dms:.*";
      # (color-picker|clipboard|spotlight|settings|bar|dash|process-list-popout|notification-center-popout|app-launcher|control-center|popout|osd|notification-popup)

      # "$menu" = "vicinae open";

      # Autostart
      exec-once = [
        "swaybg --mode fill --image ~/.config/hypr/background.jpg"
      ];

      # debug = {
      #   full_cm_proto = true;
      # };

      # exec = [
      #   "gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\""
      #   "gsettings set org.gnome.desktop.interface gtk-theme \"adw-gtk3\""
      # ];

      # Environment variables
      env = [
        "XCURSOR_THEME,catppuccin-mocha-dark-cursors"
        "XCURSOR_SIZE,20"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

      # XWayland configuration
      xwayland = {
        force_zero_scaling = true;
      };

      # General settings
      general = {
        gaps_in = "3";
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(333333ff)";
        "col.inactive_border" = "rgba(222222ff)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration settings
      decoration = {
        rounding = 6;
        rounding_power = 2;
        dim_strength = "0.1";
        dim_inactive = true;
        active_opacity = "1.0";
        inactive_opacity = "1.0";

        shadow = {
          enabled = true;
          range = 20;
          render_power = 2;
          color = "rgba(00000055)";
        };

        blur = {
          enabled = true;
          size = 15;
          passes = 3;
          xray = false;
          vibrancy = "0.5";
          ignore_opacity = true;
          new_optimizations = true;
          noise = "0.02";
          contrast = "1.1";
          popups = true;
        };
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
        enforce_permissions = true;
      };

      # Animations
      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 0, 1.94, almostLinear, fade"
          "workspacesIn, 0, 1.21, almostLinear, fade"
          "workspacesOut, 0, 1.94, almostLinear, fade"
        ];
      };

      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      group = {
        auto_group = false;

        merge_groups_on_drag = false;

        "col.border_active" = "rgba(333333ff)";
        "col.border_inactive" = "rgba(222222ff)";

        groupbar = {
          text_offset = 2;
          font_family = "Operator Mono Medium";
          font_size = 14;
          height = 24;
          gradients = true;
          "col.active" = "rgba(1e1e1eff)";
          "col.inactive" = "rgba(2b2b2bee)";
          text_color = "rgba(629e83ff)";
          text_color_inactive = "rgba(888888ee)";
          gaps_in = 0;
          gaps_out = 0;
        };
      };

      # Master layout
      master = {
        new_status = "master";
      };

      # Misc settings
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        focus_on_activate = true;
      };

      # Input settings
      input = {
        kb_layout = "us,se,ir";
        kb_variant = ",mac,winkeys";
        follow_mouse = 1;
        sensitivity = 0;
        natural_scroll = true;
        repeat_rate = 35;
        repeat_delay = 220;
      };

      # Key bindings
      bind = [
        # System controls
        "SUPER CTRL, Q, exec, $lock"
        "SUPER SHIFT, 4, exec, dms screenshot"
        "SUPER SHIFT, 5, exec, dms screenshot full"

        # Application launchers
        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, W, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, P, pseudo"

        # Focus movement
        "$windowManageMod, h, movefocus, l"
        "$windowManageMod, l, movefocus, r"
        "$windowManageMod, k, movefocus, u"
        "$windowManageMod, j, movefocus, d"

        # Focus movement group
        "$mainMod, h, changegroupactive, b"
        "$mainMod, l, changegroupactive, f"

        # Groups
        "$windowManageMod, G, togglegroup"

        # Workspace switching
        "$windowManageMod, y, workspace, 1"
        "$windowManageMod, u, workspace, 2"
        "$windowManageMod, i, workspace, 3"
        "$windowManageMod, o, workspace, 4"
        "$windowManageMod, p, workspace, 5"
        "$windowManageMod, 6, workspace, 6"
        "$windowManageMod, 7, workspace, 7"
        "$windowManageMod, 8, workspace, 8"
        "$windowManageMod, 9, workspace, 9"
        "$windowManageMod, 0, workspace, 10"

        # Move windows to workspaces
        "$windowManageMod SHIFT, y, movetoworkspace, 1"
        "$windowManageMod SHIFT, u, movetoworkspace, 2"
        "$windowManageMod SHIFT, i, movetoworkspace, 3"
        "$windowManageMod SHIFT, o, movetoworkspace, 4"
        "$windowManageMod SHIFT, p, movetoworkspace, 5"
        "$windowManageMod SHIFT, 6, movetoworkspace, 6"
        "$windowManageMod SHIFT, 7, movetoworkspace, 7"
        "$windowManageMod SHIFT, 8, movetoworkspace, 8"
        "$windowManageMod SHIFT, 9, movetoworkspace, 9"
        "$windowManageMod SHIFT, 0, movetoworkspace, 10"

        # Moving windows inside workspace
        "$windowManageMod CTRL, h, movewindoworgroup, l"
        "$windowManageMod CTRL, l, movewindoworgroup, r"
        "$windowManageMod CTRL, k, movewindoworgroup, u"
        "$windowManageMod CTRL, j, movewindoworgroup, d"

        # Window management
        "$windowManageMod, v, togglefloating"
        "$windowManageMod, f, fullscreen, 1"
        "$windowManageMod, b, pin, active"

        # Special workspace (scratchpad)
        "$windowManageMod, S, togglespecialworkspace, magic"
        "$windowManageMod SHIFT, S, movetoworkspace, special:magic"

        # Workspace navigation with mouse
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Mouse bindings
      bindm = [
        "$windowManageMod, mouse:272, movewindow"
        "$windowManageMod, mouse:273, resizewindow"
      ];

      # Volume and brightness controls
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Media controls
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Window rules
      windowrule = [
        "match:class .*, suppress_event maximize"
        "match:class ^$,match:title ^$, match:xwayland on,no_focus on,float on,fullscreen off,pin off"
      ];

      # Layer rules
      layerrule = [
        "blur on, match:namespace rofi"
        "ignore_alpha 0, match:namespace rofi"
        # "blur on, $blur_layer"
        # "ignorealpha 0, $blur_layer"
        # "no_anim on, ^(dms)$"
        "blur on, match:namespace noctalia-background-.*$"
        "ignore_alpha 0.5, match:namespace noctalia-background-.*$"
        "blur_popups on, match:namespace noctalia-background-.*$"
      ];

      # Workspace configuration
      workspace = [
        "1, defaultName:Y"
        "2, defaultName:U"
        "3, defaultName:I"
        "4, defaultName:O"
        "5, defaultName:P"
      ];
    };
  };
}
