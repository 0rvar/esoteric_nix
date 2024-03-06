# cimfomfa.nix
{
  stdenv,
  autoreconfHook,
  lib,
}:
stdenv.mkDerivation {
  name = "cimfomfa";
  src = lib.cleanSource ./.;
  nativeBuildInputs = [ autoreconfHook ];
}