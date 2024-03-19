{ stdenv
, cmake
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  name = "aheui";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "aheui";
    repo = "caheui";
    rev = "c53987b";
    sha256 = "sha256-EnSik9Wux8QDBPPFaJ35Ev6Vgth6dQxpYgLYW/7XsV4=";
  };

  installPhase = ''
    mkdir -p $out/bin
    make install PREFIX=$out
  '';
}
