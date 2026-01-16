{
  pkgs,
  ...
}:
let
  braveCmd = "flatpak run com.brave.Browser";
in
{
  xdg.desktopEntries.chatgpt = {
    name = "ChatGPT";
    genericName = "AI Assistant";
    comment = "Chat with ChatGPT";
    exec = "${braveCmd} --app=https://chat.openai.com";
    icon = "${pkgs.fetchurl {
      url = "https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg";
      sha256 = "sha256-Wo2tKGTMHIEJ6650vqRH3y8wuXi9rVZ0kkfEBuHLIic=";
    }}";
    categories = [ "Utility" "Chat" ];
    type = "Application";
    terminal = false;
  };

  xdg.desktopEntries.discord = {
    name = "Discord";
    genericName = "Discord app";
    comment = "Chat with your friends";
    exec = "${braveCmd} --app=https://discord.com/channels/@me";
    icon = "${pkgs.fetchurl {
      url = "https://cdn.prod.website-files.com/6257adef93867e50d84d30e2/66e3d80db9971f10a9757c99_Symbol.svg";
      sha256 = "sha256-KWKGqhEsRACvjpYZGriI+Bq9S9HV3HKUESpiLvQ1gbE=";
    }}";
    categories = [ "Chat" ];
    type = "Application";
    terminal = false;
  };
}
