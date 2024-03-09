{ stdenv
, fetchFromGitHub
, xorg
}:
stdenv.mkDerivation rec {
  name = "yorick";
  version = "2.2-b56f742";

  src = fetchFromGitHub {
    owner = "LLNL";
    repo = "yorick";
    rev = "b56f742e6fd24df47e5e13ad791c9213dc8abe4b";
    sha256 = "sha256-9qQHkYdxMN9l+YWpYdam3A3jNjhJM9p/OrlHWstz0S0";
  };

  buildInputs = [ xorg.libX11 ];

  installPhase = ''
    make install
    mkdir -p $out
    cp -r ./relocate/* $out
  '';

}
