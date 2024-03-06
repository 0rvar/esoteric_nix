{ nixpkgs }: {
  zoem = nixpkgs.callPackage ./zoem.nix {
    cimfomfa = nixpkgs.callPackage ./zoem/vendor/cimfomfa/cimfomfa.nix { };
  };
}
