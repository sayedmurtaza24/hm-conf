{ pkgs, ... }:
{
  home.username = "murtaza";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/murtaza";

  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    slack
  ];

  targets.darwin.linkApps.enable = false;
  targets.darwin.copyApps.enable = true;
}
