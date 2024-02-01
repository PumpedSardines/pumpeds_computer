{ pkgs ? import <nixpkgs> { } }:
let
  manifest = (pkgs.lib.importTOML ./compiler/Cargo.toml).package;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = manifest.name;
  version = manifest.version;
  cargoLock.lockFile = ./compiler/Cargo.lock;
  src = pkgs.lib.cleanSource ./compiler/.;
}
