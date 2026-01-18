{ pkgs,... }:
{
  home.packages = with pkgs; [
    google-cloud-sdk
    docker
    nodejs
    bun
  ];

  home.sessionVariables = {
    GOPRIVATE = "gitlab.com/trailgames/*,gitlab.com/trailgames/eng/lib/go-modules/*";
  };
}
