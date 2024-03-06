# zoem.nix
{
  stdenv,
  autoreconfHook,
  lib,
  cimfomfa
}:
stdenv.mkDerivation {
  name = "zoem";
  src = lib.cleanSource ./.;
  buildInputs = [ cimfomfa ];
  nativeBuildInputs = [ autoreconfHook ];
  preBuild = ''
    shed/setversion 23
  '';
}