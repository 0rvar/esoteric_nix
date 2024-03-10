{ stdenv
, cmake
, libedit
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  name = "brainfuck";
  version = "2.7.3";

  src = fetchFromGitHub {
    owner = "fabianishere";
    repo = "brainfuck";
    rev = "${version}";
    sha256 = "sha256-SF4szekWs3mTf4rXEPMmmMYAK4Tf+iUSiyUdOUZWQeg";
  };

  postPatch = ''
    substituteInPlace include/brainfuck.h \
      --replace "#define BRAINFUCK_TAPE_SIZE 30000" "#define BRAINFUCK_TAPE_SIZE 300000"
  '';

  buildInputs = [ libedit ];
  nativeBuildInputs = [ cmake ];
}
