{ pkgs ? import <nixpkgs> { } }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "thue";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "adamsoutar";
    repo = "thue";
    rev = "1.0";
    sha256 = "sha256-FL/sTS/DQiQUyhKnDr2aRQOk96BVTO9JShI5bgvkCaA=";
  };

  cargoSha256 = "sha256-/jCFN+XNNFkJttz14yGuJgIGTwIThMqaf59c03cvpM8=";

  # Optional: Specify build inputs or dependencies if there are any
  # buildInputs = [ ];

  # Optional: Include any necessary environment variables, build flags, etc.
  # preBuild = ''

  postUnpack = ''
    substituteInPlace $sourceRoot/src/interpreter.rs \
      --replace "println!(\"\\nFinal string:\\n{}\", output);" \
                "if output.len() > 0 { println!(\"\\nFinal string:\\n{}\", output); }"
  '';
}
