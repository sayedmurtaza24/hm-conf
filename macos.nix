{ pkgs, ... }:
{
  home.username = "murtaza";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/murtaza";

  imports = [
    ./common.nix

    ./modules/work.nix
    ./modules/colima.nix
    ./modules/aerospace.nix
  ];

  home.packages = with pkgs; [
    slack
    chatgpt
    sensible-side-buttons
  ];

  targets.darwin.linkApps.enable = false;
  targets.darwin.copyApps.enable = true;

  home.sessionVariables = {
    LC_ALL="en_US.UTF-8";
  };
}
