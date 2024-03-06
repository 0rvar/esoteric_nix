{
  description = "A macro/programming language with stacks";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "nixpkgs/nixos-21.05";
  inputs.cimfomfa.url = "path:./vendor/cimfomfa";

  outputs = { self, nixpkgs, cimfomfa }:
    let

      # to work with older version of flakes
      lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";

      # Generate a user-friendly version number.
      version = builtins.substring 0 8 lastModifiedDate;

      # System types to support.
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

    in

    {

      # A Nixpkgs overlay.
      overlay = final: prev: {

        zoem = with final; stdenv.mkDerivation rec {
          pname = "zoem";
          inherit version;

          src = ./.;

          nativeBuildInputs = [ autoreconfHook ];
          buildInputs = [ cimfomfa ];
          # preBuild = ''
          #   CFLAGS="-I${cimfomfa}/include ${CFLAGS}"
          #   LDFLAGS="-L${cimfomfa}/lib ${LDFLAGS}"
          # '';
        };

      };

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system:
        {
          inherit (nixpkgsFor.${system}) zoem;
        });

      # The default package for 'nix build'. This makes sense if the
      # flake provides only one package or there is a clear "main"
      # package.
      defaultPackage = forAllSystems (system: self.packages.${system}.zoem);

      # A NixOS module, if applicable (e.g. if the package provides a system service).
      nixosModules.zoem =
        { pkgs, ... }:
        {
          nixpkgs.overlays = [ self.overlay ];

          environment.systemPackages = [ pkgs.zoem ];

          #systemd.services = { ... };
        };

      # Tests run by 'nix flake check' and by Hydra.
      checks = forAllSystems
        (system:
          with nixpkgsFor.${system};

          {
            inherit (self.packages.${system}) zoem;

            # Additional tests, if applicable.
            test = stdenv.mkDerivation {
              pname = "zoem-test";
              inherit version;

              buildInputs = [ zoem ];

              dontUnpack = true;

              buildPhase = ''
                echo 'running some integration tests'
                [[ $(zoem) = 'Hello Nixers!' ]]
              '';

              installPhase = "mkdir -p $out";
            };
          }
        );
    };
}
