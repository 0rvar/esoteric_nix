{ stdenv, go, fetchFromGitHub }:

stdenv.mkDerivation rec  {
  pname = "goaheui";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "aheui";
    repo = "goaheui";
    rev = "71e0c9e";
    sha256 = "sha256-6skf4qqNyQgSBtKZtLGja6uUYWQU6dtG/Ed48iBrEDs=";
  };

  buildInputs = [ go ];

  buildPhase = ''
    export HOME=$TMPDIR
    go build -o goaheui main.go
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp goaheui $out/bin/
  '';
}
