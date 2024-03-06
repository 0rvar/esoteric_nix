{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      overlay = import ./overlay.nix;

      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ]
          (system:
            function (import nixpkgs {
              inherit system;
              overlays = [ overlay ];
            }));

    in
    {
      overlays.default = overlay;

      # Dynamically generate a shell for each system
      # containing all the packages in the overlay
      packages = forAllSystems
        (pkgs: {
          default =
            let
              overlayPackageNames = builtins.attrNames (overlay { } { });
              overlayPackages = map (name: pkgs.${name}) overlayPackageNames;
            in
            pkgs.buildEnv {
              name = "esoteric shell";
              paths = overlayPackages;
            };
        });
    };
}
