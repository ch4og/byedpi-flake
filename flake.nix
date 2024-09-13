{
  description = "byedpi flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.byedpi = with nixpkgs.legacyPackages.x86_64-linux;
      stdenv.mkDerivation rec {
        name = "byedpi";
        version = "0.13.1";
        src = fetchFromGitHub {
          owner = "hufrea";
          repo = "byedpi";
          rev = "v${version}";
          sha256 = "sha256-Sf5Ik8+9nKhum4/faGf44Y/gQggldyRsFUVmd9XPKOA=";
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
