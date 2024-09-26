{ lib, fetchCrate, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "falsy";
  version = "0.1.0";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-10jLkKcAbVcq2BprQ5LEpyc/KJCjemMhJAsmFSp1qqc";
  };

  cargoSha256 = "sha256-dwK3P0ZkdGdBUcbHknpu9DaCyDq69H/3ISbcoG0GkNE=";

  meta = with lib; {
    description = "False interpreter written in Rust";
    homepage = "https://crates.io/crates/falsy";
    license = licenses.mit;
  };
}
