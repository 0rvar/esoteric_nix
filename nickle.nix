{ stdenv, autoreconfHook, pkg-config, readline, yacc, flex }:

stdenv.mkDerivation rec {
  pname = "nickle";
  version = "2024-01-14";

  src = ./nickle;

  nativeBuildInputs = [ pkg-config autoreconfHook yacc flex ];
  buildInputs = [
    readline
  ];
}
