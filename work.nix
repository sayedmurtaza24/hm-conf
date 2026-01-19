{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    google-cloud-sdk
    nodejs
    bun
    llvm_21
    protobuf
    protoc-gen-go-grpc
    docker
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
    bgen = "${pkgs.docker}/bin/docker run --rm -w /mount -v $(pwd):/mount europe-docker.pkg.dev/pley-artifacts/containers/ci-tools/bruno:1.5.1 gen";
  };

  programs.docker-cli = {
    enable = true;
    settings = {
      credHelpers = {
        "europe-docker.pkg.dev" = "gcloud";
      };
    };
  };
}
