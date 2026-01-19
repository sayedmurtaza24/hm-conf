{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    google-cloud-sdk
    docker
    nodejs
    bun
    llvm_21
  ];

  home.sessionVariables = {
    GOBIN="${config.home.homeDirectory}/go/bin";
    GOPRIVATE = "gitlab.com/trailgames/*,gitlab.com/trailgames/eng/lib/go-modules/*";
    CGO_LDFLAGS="-L/opt/homebrew/lib";
    CGO_CPPFLAGS="-I/opt/homebrew/include";
    TRAIL_ENABLE_DEBUGGING=1;
  };

  programs.zsh.shellAliases = {
    bsync = "$GOBIN/bruno sync $(git branch --show-current)";
  };
}
