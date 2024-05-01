{ lib, fetchCrate, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "anyfuck";
  version = "0.1.0";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-iQ5vStxTqClwI8igrBIUUNWAnubK+UDPS+MVGh3inho=";
  };

  cargoSha256 = "sha256-OFjgqXvzSxY0VI/k02nirTjhfShvry3l+dXiqkX+yNU=";

  meta = with lib; {
    description = "Brainfuck-Like Languages Interpreter";
    homepage = "https://crates.io/crates/anyfuck";
    license = licenses.mit;
  };
}
