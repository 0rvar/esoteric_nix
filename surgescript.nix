# git@github.com:alemart/surgescript.git

{ stdenv
, cmake
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  name = "surgescript";
  version = "0.5.6.1";

  src = fetchFromGitHub {
    owner = "alemart";
    repo = "surgescript";
    rev = "v${version}";
    sha256 = "sha256-0mgfam1zJfDGG558Vo1TysE2ehPD30XCP/j3GMnqN9w";
  };

  buildInputs = [ ];
  nativeBuildInputs = [ cmake ];
}
