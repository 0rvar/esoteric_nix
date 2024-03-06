{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
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
            }));

    in
    {
      # Dynamically generate a shell for each system
      # containing all the packages in the overlay
      packages = forAllSystems
        (pkgs:
          let
            packageMap = import ./packages.nix { inherit pkgs; };
            packageNames = builtins.attrNames packageMap;
            packagePaths = map (name: packageMap.${name}) packageNames;
          in
          packageMap // {
            default =
              pkgs.buildEnv {
                name = "esoteric_nix_all";
                paths = packagePaths;
              };
          });
    };
}
