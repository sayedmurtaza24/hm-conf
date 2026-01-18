{
  description = "Home Configuration";

  inputs = {
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
    # quickshell = {
    #   url = "github:outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # dgop = {
    #   url = "github:AvengeMedia/dgop";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # dank-material-shell = {
    #   url = "github:AvengeMedia/DankMaterialShell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      systems = {
        "aarch64-darwin" = {
          file = ./macos.nix;
          modules = [];
        };
        "x86_64-linux" = {
          file = ./nixos.nix;
          modules = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
        };
      };

      mkHomeConfiguration = system: config:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          modules = [
            config.file
          ] ++ config.modules;
          extraSpecialArgs = { inherit inputs; };
        };
    in {
    homeConfigurations = {
      # Default configuration - auto-detects based on username@hostname
      murtaza = mkHomeConfiguration "aarch64-darwin" systems."aarch64-darwin";
      "murtaza@nixos" = mkHomeConfiguration "x86_64-linux" systems."x86_64-linux";
    };
  };
}
