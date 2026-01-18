{
  programs.aerospace = {
    enable = true;
    launchd.enable = true;

    settings = {
      after-login-command = [];
      after-startup-command = [];
      start-at-login = true;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      key-mapping.preset = "qwerty";
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

      gaps = {
        inner.horizontal = 5;
        inner.vertical = 5;
        outer.left = 5;
        outer.bottom = 5;
        outer.top = 5;
        outer.right = 5;
      };

      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-ctrl-h = "join-with left";
        alt-ctrl-j = "join-with down";
        alt-ctrl-k = "join-with up";
        alt-ctrl-l = "join-with right";

        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-y = "workspace Y";
        alt-u = "workspace U";
        alt-i = "workspace I";
        alt-o = "workspace O";
        alt-m = "workspace M";
        alt-n = "workspace N";
        alt-p = "workspace P";

        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-y = "move-node-to-workspace Y";
        alt-shift-u = "move-node-to-workspace U";
        alt-shift-i = "move-node-to-workspace I";
        alt-shift-o = "move-node-to-workspace O";
        alt-shift-m = "move-node-to-workspace M";
        alt-shift-n = "move-node-to-workspace N";
        alt-shift-p = "move-node-to-workspace P";

        alt-semicolon = "move-workspace-to-monitor --wrap-around next";

        alt-f = [ "layout floating tiling" "mode main" ];

        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        esc = ["reload-config" "mode main"];
        f = [ "layout floating tiling" "mode main"];
        backspace = ["close-all-windows-but-current" "mode main"];
      };

      on-window-detected = [
        {
          "if".app-id = "com.mitchellh.ghostty";
          run = "move-node-to-workspace I";
        }
        {
          "if".app-id = "com.tinyspeck.slackmacgap";
          run = "move-node-to-workspace Y";
        }
        {
          "if".app-id = "com.openai.chat";
          run = "move-node-to-workspace M";
        }
        {
          "if".app-id = "com.google.Chrome";
          run = "move-node-to-workspace N";
        }
        {
          "if".app-id = "com.apple.Safari";
          run = "move-node-to-workspace U";
        }
        {
          "if".app-id = "app.zen-browser.zen";
          run = "move-node-to-workspace U";
        }
        {
          "if".app-id = "com.linear";
          run = "move-node-to-workspace P";
        }
        {
          "if".app-id = "com.hnc.Discord";
          run = "move-node-to-workspace 7";
        }
        {
          "if".app-id = "com.nvidia.gfnpc.mall";
          run = "move-node-to-workspace 6";
        }
      ];
    };
  };
}
