{ stdenv
, lib
, fetchurl
, autoreconfHook
, pkg-config
, intltool
, termcap
, readline
, gmp
, mpfr
, glib
, gtk3
, vte
}:

stdenv.mkDerivation rec {
  pname = "genius";
  version = "1.0.27";

  src = fetchurl {
    url = "https://download.gnome.org/sources/genius/1.0/${pname}-${version}.tar.xz";
    sha256 = "0243b7c36b5f9e930c62778acd52deb188deeca704a5e195337018435d9e7bb5";
  };

  nativeBuildInputs = [ autoreconfHook intltool pkg-config ];

  buildInputs = [ termcap readline gmp mpfr glib gtk3 vte ];

  NIX_CFLAGS_COMPILE = "-g";

  meta = {
    description = "Genius is a general purpose calculator program similar in some aspects to BC, Matlab, Maple or Mathematica";
    homepage = "https://www.jirka.org/genius.html";
    license = lib.licenses.gpl3;
  };
}
