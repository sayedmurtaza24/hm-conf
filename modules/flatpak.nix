{ inputs, ... }:
{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    remotes = [
      {name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo";}
      {name = "nvidia"; location = "https://international.download.nvidia.com/GFNLinux/flatpak/geforcenow.flatpakrepo";}
    ];
    packages = [
      { appId = "com.brave.Browser";          origin = "flathub"; }
      { appId = "com.github.tchx84.Flatseal"; origin = "flathub"; }
      { appId = "app.zen_browser.zen";        origin = "flathub"; }
      { appId = "net.nokyan.Resources";       origin = "flathub"; }
      { appId = "com.nvidia.geforcenow";      origin = "nvidia"; }
    ];
  };
}
