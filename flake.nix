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
        # Desktop eww config
        everest = mkDerivation rec {
          name = "eww";
          src = ./everest;

          buildCommand = ''
            cp -r ${src} $out
          '';
        };
        # Laptop eww config
        denali = mkDerivation rec {
          name = "eww";
          src = ./denali;

          buildCommand = ''
            cp -r ${src} $out
          '';
        };
        # Generic configuration
        skyrim = mkDerivation rec {
          name = "eww";
          src = ./skyrim;

          buildCommand = ''
            cp -r ${src} $out
          '';
        };
      };
    });
}
