{ stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation rec {
  pname = "lazyk";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "msullivan";
    repo = "LazyK";
    rev = "459a87d";
    sha256 = "sha256-YtwuUOunVqikTD9cp7voSgiRqM3gjiVshTnG24GQs9o=";
  };

  buildInputs = [ gcc ];

  buildPhase = ''
    g++ $src/lazy.cpp -o lazyk
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp lazyk $out/bin/
  '';
}
