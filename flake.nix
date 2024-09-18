{
  description = "byedpi flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.byedpi = with nixpkgs.legacyPackages.x86_64-linux;
      stdenv.mkDerivation rec {
        name = "ciadpi";
        version = "0.14.1";
        src = fetchFromGitHub {
          owner = "hufrea";
          repo = "byedpi";
          rev = "v${version}";
          sha256 = "sha256-JdL+3ETNxaEtOLUhgLSABL9C8w/EM4Ay37OXU5jLCFA=";
        };
        buildInputs = [ gcc gnumake ];
        buildPhase = ''
          make
        '';
        installPhase = ''
          mkdir -p $out/bin 
          cp ciadpi $out/bin/ 
        '';
      };
  };
}
