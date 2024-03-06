{ stdenv
, autoreconfHook
, lib
}:
stdenv.mkDerivation {
  name = "cimfomfa";
  src = lib.cleanSource ./cimfomfa;
  nativeBuildInputs = [ autoreconfHook ];
}
