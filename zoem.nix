{ stdenv
, autoreconfHook
, lib
, pkgs ? import <nixpkgs> { }
}:
stdenv.mkDerivation {
  name = "zoem";
  src = lib.cleanSource ./zoem;
  buildInputs = [ (pkgs.callPackage ./zoem/vendor/cimfomfa.nix { }) ];
  nativeBuildInputs = [ autoreconfHook ];
}
