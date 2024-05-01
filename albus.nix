{ pkgs ? import <nixpkgs> { } }:

let
  cargoLockFile = ./albus.Cargo.lock;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "albus";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "collidedscope";
    repo = "albus";
    rev = "ec3f606";
    sha256 = "sha256-pj0IyAFvdnUVCNC0WnqAW95RFppHzrZjqKzrjHiHZvY";
  };

  cargoSha256 = "sha256-fqoxi2HcIttyGW1erlzX02iieKjONN6YBrsOMJQv5Tw";

  postUnpack = ''
    cp ${cargoLockFile} $sourceRoot/Cargo.lock
    substituteInPlace $sourceRoot/src/main.rs \
      --replace-fail "print!(\"stack: [\");" \
                "return;print!(\"stack: [\");"
  '';
}
