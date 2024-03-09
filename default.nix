let
  # Import the Nix Packages collection, allowing you to specify a specific revision or configuration if desired.
  pkgs = import <nixpkgs> { };

  # Import your packages.nix, passing `pkgs` to it.
  myPackages = import ./packages.nix { inherit pkgs; };
in
myPackages
