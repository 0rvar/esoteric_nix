{ stdenv, lib, fetchgit, gcc, darwin }:

stdenv.mkDerivation rec {
  pname = "afnix";
  version = "3.8.0";

  src = fetchgit {
    url = "https://salsa.debian.org/debian/afnix.git";
    rev = "81545144023f64ccdcfdfd40943e0f156ca75f05";
    sha256 = "sha256-Ttl3TYCfUW3CF25pcS26Ex2X5thYwMPV4liVoGcxrFw=";
  };

  nativeBuildInputs = [ gcc ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreServices
    darwin.xcode
  ];


  preConfigure = lib.optionalString stdenv.isDarwin ''
    export sdkdir=$(xcrun --sdk macosx --show-sdk-path)
    echo SDK DIR: $sdkdir
  '';
}
