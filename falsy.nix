{ lib, fetchCrate, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "falsy";
  version = "0.2.0";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-aRobKPVYhWAY6kmVKQRLtXVPngBNZg9bh2CyHSFzC/A=";
  };

  cargoSha256 = "sha256-4n0MsoTu9rvwsKMqjmPX8ANwFoU3+VJl6NjRVypDyNg=";

  meta = with lib; {
    description = "False interpreter written in Rust";
    homepage = "https://crates.io/crates/falsy";
    license = licenses.mit;
  };
}
