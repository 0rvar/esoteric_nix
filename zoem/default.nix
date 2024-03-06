import <nixpkgs> {
  overlays = [
    (final: prev: {
      cimfomfa = final.callPackage ./vendor/cimfomfa/cimfomfa.nix {};
      zoem = final.callPackage ./zoem.nix {};
    })
  ];
}

