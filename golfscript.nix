{ stdenv, fetchFromGitHub, ruby, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "golfscript";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "darrenks";
    repo = "golfscript";
    rev = "cded542";
    sha256 = "sha256-RAqKMX5mlPG4CK42aIAd8SY4q5J5dUHhx+x/mPTV+K4=";
  };

  buildInputs = [ ruby makeWrapper ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/golfscript.rb $out/bin/golfscript.rb
    makeWrapper ${ruby}/bin/ruby $out/bin/golfscript --add-flags $out/bin/golfscript.rb
  '';

  meta = {
    description = "Golfscript interpreter";
    homepage = "http://www.golfscript.com/golfscript/";
  };
}
