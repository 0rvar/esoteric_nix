{ lib, stdenv, fetchgit, autoreconfHook, pkg-config, libffi }:

stdenv.mkDerivation rec {
  pname = "gambas";
  version = "3.19.1";

  src = fetchgit {
    url = "https://gitlab.com/gambas/gambas.git";
    rev = version;
    sha256 = "sha256-/IxmngzK3mNk31vG2LX756M/XyN9kvHJbudOrn+SkYU=";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config ];

  buildInputs = [ libffi ];

  # CFLAGS="-std=gnu89"
  # NIX_CFLAGS_COMPILE = "-std=gnu89";
  configureFlags = [
    "-C"
    "CFLAGS=-std=gnu89"
  ];
  env.NIX_DEBUG = "1";
  env.CFLAGS = "-std=gnu89";

  meta = with lib; {
    description = "Gambas is a free development environment and a full powerful development platform based on a Basic interpreter with object extensions, as easy as Visual Basic™.";
    homepage = "http://gambas.sourceforge.net/";
    license = licenses.gpl2Plus;
  };
}
