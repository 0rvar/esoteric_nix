{ pkgs }: {
  zoem = pkgs.callPackage ./zoem.nix {
    inherit pkgs;
  };
}
