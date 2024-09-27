{
  description = "Procenka application";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    purescript-overlay.url = "github:thomashoneyman/purescript-overlay";
  };

  outputs = { self, nixpkgs, purescript-overlay }:
    let
      name = "procenak";
      system = "x86_64-linux";
      overlays = [ purescript-overlay.overlays.default ];
      pkgs = import nixpkgs { inherit system overlays; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = name;

        buildInputs = [
          pkgs.esbuild
          pkgs.just
          pkgs.nodejs_20
          pkgs.nixpkgs-fmt
          pkgs.purs
          pkgs.purs-tidy
          pkgs.purs-backend-es
          pkgs.purescript-language-server
          pkgs.spago-unstable
          pkgs.watchexec
        ];
      };
    };
}
