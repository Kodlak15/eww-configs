{
  description = "My Eww configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      mkDerivation = pkgs.stdenv.mkDerivation;
    in {
      packages = {
        default = mkDerivation rec {
          name = "eww";
          src = ./default;

          buildCommand = ''
            cp -r ${src} $out
          '';
        };
      };
    });
}
