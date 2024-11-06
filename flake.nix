{
  description = "byedpi flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = with pkgs; {
          byedpi = stdenv.mkDerivation rec {
            name = "ciadpi";
            version = "0.15";
            src = fetchFromGitHub {
              owner = "hufrea";
              repo = "byedpi";
              rev = "v${version}";
              sha256 = "sha256-jsQFfIvWvpJRBewUSS5bhDGocfPTvtG6LiejUxdqk28=";
            };
            installPhase = ''
              runHook preInstall
              install -Dm755 ciadpi $out/bin/ciadpi
              runHook postInstall
            '';
          };
          default = byedpi;
        };
      }
    );
}
