{ stdenv
, cmake
, libbsd
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  name = "cfunge";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "VorpalBlade";
    repo = "cfunge";
    rev = "b7bf640";
    sha256 = "sha256-Qx/024ftr4YTmTqn8oxuiys28j/RYHtv+o0hbGsiHW0=";
  };

  buildInputs = [ libbsd ];

  nativeBuildInputs = [ cmake ];
  CFLAGS = "-Wno-implicit-function-declaration";
}
