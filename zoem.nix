# zoem.nix
{
  stdenv,
  autoreconfHook,
  lib,
  cimfomfa
}:
stdenv.mkDerivation {
  name = "zoem";
  src = lib.cleanSource ./zoem;
  buildInputs = [ cimfomfa ];
  nativeBuildInputs = [ autoreconfHook ];
}