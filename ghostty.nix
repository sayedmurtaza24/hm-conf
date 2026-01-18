{ pkgs, ... }:{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    systemd.enable = !pkgs.stdenv.hostPlatform.isDarwin;
    package = pkgs.ghostty-bin;

    settings = {
      # mac only
      background-blur = if pkgs.stdenv.hostPlatform.isDarwin then 90 else 0;
      macos-titlebar-style = "hidden";
      # end

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

      font-size = 14;

      theme = "Kanagawabones";
      # config-file = "${config.xdg.configHome}/ghostty/config-dankcolors";
      background = "#141416";
      minimum-contrast = 1;
      cursor-style = "block";

      cursor-click-to-move = true;
      background-opacity = 0.80;
      unfocused-split-opacity = 0.7;

      scrollback-limit = 10000000;
      link-url = true;
      fullscreen = false;

      window-padding-x = 10;
      window-padding-y = 10;
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
    };
  };
}
