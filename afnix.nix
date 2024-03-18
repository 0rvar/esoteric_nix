{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  pname = "afnix";
  version = "3.8.0";

  src = pkgs.fetchgit {
    url = "https://salsa.debian.org/debian/afnix.git";
    rev = "81545144023f64ccdcfdfd40943e0f156ca75f05";
    sha256 = "sha256-Ttl3TYCfUW3CF25pcS26Ex2X5thYwMPV4liVoGcxrFw=";
  };
}
