{ pkgs, lib, ... }:{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

    settings = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isDarwin {
        background-blur = 60;
        macos-titlebar-style = "tabs";
        adjust-cell-height = 2;
        adjust-font-baseline = 1;
        adjust-cursor-height = 2;
        font-thicken = true;
        font-thicken-strength = 1;
        alpha-blending = "native";
        font-synthetic-style = "bold,italic,bold-italic";
        font-size = 18;
        background-opacity = 0.80;
        window-padding-y = 0;
      })

      (lib.mkIf (!pkgs.stdenv.isDarwin) {
        font-size = 14;
        background-opacity = 0.80;
        window-padding-y = 10;
      })

      {
        font-family = "Operator Mono";
        font-style = "Book";
        font-style-italic = "Book Italic";
        font-style-bold = "Medium";
        font-style-bold-italic = "Medium Italic";
        adjust-cell-height = 2;
        adjust-font-baseline = 1;
        adjust-cursor-height = 2;

        font-thicken = true;
        font-thicken-strength = 1;
        alpha-blending = "native";

        theme = "Kanagawabones";
        # config-file = "${config.xdg.configHome}/ghostty/config-dankcolors";
        background = "#141416";
        minimum-contrast = 1;
        cursor-style = "block";

        cursor-click-to-move = true;
        unfocused-split-opacity = 0.7;

        scrollback-limit = 10000000;
        link-url = true;
        fullscreen = false;

        window-padding-x = 10;
        window-padding-balance = true;
        window-padding-color = "background";
        window-vsync = true;
        window-inherit-working-directory = true;
        window-inherit-font-size = false;
        window-decoration = "auto";
        window-show-tab-bar = "never";

        focus-follows-mouse = true;

        copy-on-select = "clipboard";

        keybind = [
          "ctrl+\\=new_split:right"
          "ctrl+-=new_split:down"
          "ctrl+shift+k=goto_split:up"
          "ctrl+shift+j=goto_split:down"
          "ctrl+shift+h=goto_split:left"
          "ctrl+shift+l=goto_split:right"
          "ctrl+f=toggle_split_zoom"
        ];
      }
    ];
  };
}
