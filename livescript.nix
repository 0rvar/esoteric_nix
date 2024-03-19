{ stdenv
, fetchFromGitHub
, pkgs ? import <nixpkgs> { }
}:

let
  packageLockJson = pkgs.writeText "package-lock.json" (builtins.readFile ./livescript_package-lock.json);
in
stdenv.mkDerivation rec {
  name = "livescript";
  version = "1.6.1";

  src = fetchFromGitHub {
    owner = "gkz";
    repo = "LiveScript";
    rev = version;
    sha256 = "sha256-92ezj294tWfhiETa3AEWjFbMv2NYOQfEykN8DkUtfOU=";
  };

  nativeBuildInputs = [ pkgs.nodejs ];

  buildInputs = [ pkgs.cacert ];

  buildPhase = ''
    export HOME=$(mktemp -d)
    export NODE_EXTRA_CA_CERTS="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    install -D -m644 ${packageLockJson} ./package-lock.json
    npm install --production
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r * $out
  '';
}
