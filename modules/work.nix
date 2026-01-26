{ pkgs, config, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents( with pkgs.google-cloud-sdk.components; [
    log-streaming
  ]);
in
{
  home.packages = with pkgs; [
    gdk
    nodejs_22
    typescript-language-server
    bun
    llvm_21
    protobuf
    protoc-gen-go-grpc
    docker
    fzf
    postgresql
  ];

  home.sessionVariables = {
    GOBIN="${config.home.homeDirectory}/go/bin";
    GOPRIVATE = "gitlab.com/trailgames/*,gitlab.com/trailgames/eng/lib/go-modules/*";
    CGO_LDFLAGS="-L/opt/homebrew/lib";
    CGO_CPPFLAGS="-I/opt/homebrew/include";
    TRAIL_ENABLE_DEBUGGING=1;
    PATH="$PATH:$GOBIN";
  };

  programs.zsh.shellAliases = {
    bsync = "$GOBIN/bruno sync $(git branch --show-current)";
    bgen = "${pkgs.docker}/bin/docker run --rm -w /mount -v $(pwd):/mount europe-docker.pkg.dev/pley-artifacts/containers/ci-tools/bruno:1.5.1 gen";
    logmainprod = "git fetch && git log origin/main --not origin/prod";
    logprodmain = "git fetch && git log origin/prod --not origin/main";
  };

  programs.docker-cli = {
    enable = true;
    settings = {
      credHelpers = {
        "europe-docker.pkg.dev" = "gcloud";
      };
    };
  };

  programs.git.includes = [
    {
        condition = "hasconfig:remote.*.url:git@gitlab.com:trailgames/**";
        contents = {
          user.name = "murtaza._";
          user.email = "murtaza@trail.gg";
        };
    }
  ];
}
