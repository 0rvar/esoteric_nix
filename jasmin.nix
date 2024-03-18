{ pkgs ? import <nixpkgs> { } }:

let
  version = "2023.06.2";
  # Replace these values with the actual repository details
  jasminRemote = pkgs.fetchFromGitHub {
    owner = "jasmin-lang";
    repo = "jasmin";
    rev = "v${version}";
    sha256 = "sha256-nPRCDq92/HkEgiJg2myK6X8wWnFpjU1fh2xSLFQuL0I";
  };
in
{
  # Import the package's default.nix and use it in your own environment
  jasmin = import jasminRemote { inherit pkgs; };
}
