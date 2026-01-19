{ pkgs, ... }:
{
  home.username = "murtaza";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/murtaza";

  imports = [
    ./common.nix
    ./work.nix
    ./colima.nix
  ];

  home.packages = with pkgs; [
    slack
    chatgpt
  ];

  targets.darwin.linkApps.enable = false;
  targets.darwin.copyApps.enable = true;

  home.sessionVariables = {
    LC_ALL="en_US.UTF-8";
  };
}
