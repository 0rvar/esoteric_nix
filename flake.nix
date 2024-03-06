{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 

  flake-utils.lib.eachDefaultSystem (system:
    let
      overlay = import ./overlay.nix;

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
      };
      overlayPackageNames = builtins.attrNames (overlay {} {});
      devshellPackages = map (name: pkgs.${name}) overlayPackageNames;

    in {
      overlays.default = overlay;

      # Define a devShell for the given system
      devShells.default = pkgs.mkShell {
        buildInputs = devshellPackages;
      };
    }
  );
}