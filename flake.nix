{
  description = "Home Configuration";

  inputs = {
    stableNixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs , stableNixpkgs , home-manager , ... } @ inputs:
    let
      systems = {
        aarch64-darwin = {
          file = ./macos.nix;
          modules = [];
        };

        x86_64-linux = {
          file = ./nixos.nix;
          modules = [
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
            inputs.dms.homeModules.dank-material-shell
            inputs.caelestia-shell.homeManagerModules.default
          ];
        };
      };

      mkHomeConfiguration = system: config:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          pkgsStable = import stableNixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules =
            [ config.file ]
            ++ config.modules;

          extraSpecialArgs = {
            inherit inputs pkgsStable;
          };
        };
    in
    {
      homeConfigurations = {
        murtaza =
          mkHomeConfiguration
            "aarch64-darwin"
            systems.aarch64-darwin;

        "murtaza@nixos" =
          mkHomeConfiguration
            "x86_64-linux"
            systems.x86_64-linux;
      };
    };
}
