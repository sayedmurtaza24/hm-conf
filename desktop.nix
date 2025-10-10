{
  xdg.desktopEntries.chatgpt = {
    name = "ChatGPT";
    genericName = "ChatGPT App";
    exec = "flatpak run com.brave.Browser --app=https://chat.openai.com";
    terminal = false;
    icon = "com.brave.Browser";
    categories = [ "Network" "WebBrowser" ];
  };
}
