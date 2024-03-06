{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      overlay = import ./overlay.nix;
    in
    {
      overlays.default = overlay;
    }
    //

    # Dynamically generate a shell for each system
    # containing all the packages in the overlay
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
        overlayPackageNames = builtins.attrNames (overlay { } { });
        overlayPackages = map (name: pkgs.${name}) overlayPackageNames;

      in
      {
        packages.default = pkgs.buildEnv {
          name = "esoteric shell";
          paths = overlayPackages;
        };
      }
    );
}
