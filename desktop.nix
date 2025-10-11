{
  pkgs,
  ...
}:
{
xdg.desktopEntries.chatgpt = {
  name = "ChatGPT";
  genericName = "AI Assistant";
  comment = "Chat with ChatGPT";
  exec = "chromium --app=https://chat.openai.com";
  icon = "${pkgs.fetchurl {
    url = "https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg";
    sha256 = "sha256-Wo2tKGTMHIEJ6650vqRH3y8wuXi9rVZ0kkfEBuHLIic=";
  }}";
  categories = [ "Utility" "Chat" ];
  type = "Application";
  terminal = false;
};
}
